#!/usr/bin/env bash
path='/tmp/njk'

# install configurating
read -p '- Username: ' name
read -sp '- Password: ' password; echo
read -p '- Timezone (Europe/Moscow): ' zone
read -p '- Locale (ru_RU): ' kbl
read -p '- Target disk name: ' disk
read -p '- Do you want to destroy your own disk? (y/n): ' agreement

case "$agreement" in
    y) true;;
    n) exit 0;;
    *) exit 1;;
esac

# disk partition
sleep 2
cd /
umount -R /mnt
umount /dev/$disk*
wipefs -a /dev/$disk
echo -e 'label:gpt\n,512M,U,-\n+' | sfdisk -w always -W always /dev/$disk

mkfs.fat -vF32 -n 'ESP' --codepage=437 /dev/$disk*1
mkfs.f2fs -fil 'archlinux' -O 'extra_attr,inode_checksum,sb_checksum,compression' /dev/$disk*2

mount -t f2fs -o 'noatime,compress_algorithm=zstd:3,compress_cache,compress_chksum' /dev/$disk*2 /mnt
mount -t vfat --mkdir=600 -o 'umask=0177,noexec,noatime,shortname=winnt,utf8=false,discard' /dev/$disk*1 /mnt/boot

# ntp
sed -i -e 's/#NTP=/NTP=/' -e 's/#FallbackNTP=.*/FallbackNTP=time.google.com/' /etc/systemd/timesyncd.conf
systemctl restart systemd-timesyncd

# installing
mkdir -p /mnt/etc
echo 'compression: lz4' > /mnt/etc/booster.yaml
pacstrap -cKP /mnt base linux-zen booster linux-firmware amd-ucode \
                  opendoas vulkan-radeon libva-mesa-driver \
                  f2fs-tools dosfstools e2fsprogs exfatprogs \
                  android-tools android-udev git bash-completion zip flatpak zram-generator nano gnome networkmanager \
                  pipewire{,-alsa,-pulse,-jack} --ignore totem --ignore gnome-tour --ignore epiphany
sed -i -e 's/#en_US.UTF-8/en_US.UTF-8/' -e "s/#$kbl.UTF-8/$kbl.UTF-8/" /mnt/etc/locale.gen
genfstab -U /mnt > /mnt/etc/fstab

mount --bind "$path" /mnt/mnt
arch-chroot /mnt bash /mnt/inchroot.sh "$name" "$password" "$zone"

# post configuration
echo 'permit persist :wheel as root' > /mnt/etc/doas.conf
chmod 400 /mnt/etc/doas.conf
echo 'nedocomp' > /mnt/etc/hostname
sed -i 's/#DefaultTimeoutStopSec=.*/DefaultTimeoutStopSec=5s/' /mnt/etc/systemd/system.conf
cat /etc/systemd/timesyncd.conf > /mnt/etc/systemd/timesyncd.conf

uuid="$(blkid -s UUID -o value /dev/$disk*2)"
cat $path/sys-configs/arch-zen.conf | sed "s/uuidv/$uuid/" > /mnt/boot/loader/entries/arch-zen.conf

cp $path/bin/{atp,wlc,fin.sh} /mnt/usr/bin
chmod +x /mnt/usr/bin/{atp,wlc,fin.sh}

cp $path/sys-configs/60-ioschedulers.rules /mnt/etc/udev/rules.d
cp $path/sys-configs/99-sysctl.conf /mnt/etc/sysctl.d
cat $path/sys-configs/loader.conf > /mnt/boot/loader/loader.conf
cat $path/sys-configs/nanorc > /mnt/etc/nanorc
cp $path/sys-configs/zram-generator.conf /etc/systemd

echo '- Goodbye ;)'
sleep 2
umount -R /mnt
systemctl poweroff
