#!/usr/bin/env bash

if [[ -z "$1" ]]; then
    echo '! Enter the target disk name!'
    exit 1
fi
disk="$1"
path='/tmp/njk'

# install configurating
read -p '- Username: ' name
read -ps '- Password: ' password
read -p '- Timezone (Europe/Moscow):' zone
read -p '- Country ISO code (for mirrors): ' loc
read -p '- Locale (ru_RU)' kbl
read -p '- Do you want to destroy your own disk? (y/n): ' agreement

case "$agreement" in
    y) true;;
    n) exit 0;;
    *) exit 1;;
esac

# disk partition
sleep 2
cd /
umount /dev/$disk*
echo -e 'label:gpt\n,1G,U,-,\n,+,\n' | sfdisk -w always -W always /dev/$disk

mkfs.fat -F32 -n 'ESP' /dev/$disk*1
mkfs.f2fs -fil 'arch' -O extra_attr,inode_checksum,sb_checksum,compression /dev/$disk*2

umount -R /mnt
mount -o 'compress_algorithm=zstd:6,compress_chksum' /dev/$disk*2 /mnt
mkdir -p /mnt/boot
mount -o 'fmask=0177,dmask=0077' /dev/$disk*1 /mnt/boot

# pacman configuration
sed -i -e 's/#ParallelDownloads = 5/ParallelDownloads = 15/' -e 's/#Colors/Colors/' -e 's/#VerbosePkgLists/VerbosePkgLists/' /etc/pacman.conf
pacman -Sy
pacman -S pacman-contrib --noconfirm
curl "https://archlinux.org/mirrorlist/?country=${loc}&protocol=https&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -wn 2 - > /etc/pacman.d/mirrorlist

# installing
pacstrap -KP /mnt base linux-zen linux-lts linux-firmware amd-ucode \
                  android-tools android-udev git bash-completion flatpak zram-generator nano \
                  opendoas networkmanager vulkan-radeon libva-mesa-driver gnome ntp pipewire pipewire-alsa pipewire-pulse pipewire-jack f2fs-tools --ignore totem --ignore gnome-tour
sed -i -e 's/#en_US.UTF-8/en_US.UTF-8/' -e "s/#$kbl.UTF-8/$kbl.UTF-8/" /mnt/etc/locale.gen
genfstab -U /mnt > /mnt/etc/fstab

mkdir -p /mnt/var/njk
mount --bind "$path" /mnt/var/njk
arch-chroot /mnt bash /var/njk/inchroot.sh "$name" "$password" "$zone"

# post configuration
echo 'permit persist :wheel as root' > /mnt/etc/doas.conf
chmod 400 /mnt/etc/doas.conf
cp $path/fin.sh /mnt/usr/bin
chmod +x /mnt/usr/bin/fin.sh
echo 'nedocomp' > /mnt/etc/hostname
sed -i 's/#DefaultTimeoutStopSec=.*/DefaultTimeoutStopSec=5s/' /mnt/etc/systemd/system.conf

uuid="$(blkid -s UUID -o value /dev/$disk*2)"
sed -i "s/uuidv/$uuid/" $path/sys-configs/arch.conf
cat $path/sys-configs/arch.conf | sed -e 's/sortkeyv/1/' -e 's/Arch Linux/& ZEN/' > /mnt/boot/loader/entries/arch-zen.conf
cat $path/sys-configs/arch.conf | sed -e 's/sortkeyv/3/' -e 's/zen/&-fallback/g' -e 's/Arch Linux/& ZEN (fallback initramfs)/' > /mnt/boot/loader/entries/arch-zen-fb.conf
cat $path/sys-configs/arch.conf | sed -e 's/sortkeyv/2/' -e 's/zen/lts/g' -e 's/Arch Linux/& LTS/' > /mnt/boot/loader/entries/arch-lts.conf
cat $path/sys-configs/arch.conf | sed -e 's/sortkeyv/4/' -e 's/zen/lts-fallback/g' -e 's/Arch Linux/& LTS (fallback initramfs)/' > /mnt/boot/loader/entries/arch-lts-fb.conf

cp $path/sys-configs/60-ioschedulers.rules /mnt/etc/udev/rules.d
cp $path/sys-configs/99-sysctl.conf /mnt/etc/sysctl.d
cat $path/sys-configs/loader.conf > /mnt/boot/loader/loader.conf
cat $path/sys-configs/nanorc > /mnt/etc/nanorc
cp $path/sys-configs/zram-generator.conf /usr/lib/systemd

echo '- Goodbye ;)'
sleep 2
umount -R /mnt
systemctl poweroff
