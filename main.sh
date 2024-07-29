#!/usr/bin/env bash
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
cd /
lsblk -o name,vendor,model,size,label,type,rm,serial,tran
read -p '- Disk name: ' disk
sleep 2
umount /dev/$disk*
wipefs --all /dev/$disk
echo -e 'label:gpt\n,1G,U,-,\n,+,\n' | sfdisk /dev/$disk

mkfs.fat -F32 -n 'ESP' /dev/$disk*1
mkfs.f2fs -fil 'arch' -O extra_attr,inode_checksum,sb_checksum,compression /dev/$disk*2
uuid="$(blkid -s UUID -o value /dev/$disk*2)"

umount -R /mnt
mount /dev/$disk*2 /mnt
mkdir -p /mnt/boot
mount /dev/$disk*1 /mnt/boot

# pacman configuration
sed -i -e 's/#ParallelDownloads = 5/ParallelDownloads = 15/' -e 's/#Colors/Colors/' -e 's/#VerbosePkgLists/VerbosePkgLists/' /etc/pacman.conf
pacman -Sy
pacman -S pacman-contrib --noconfirm
curl "https://archlinux.org/mirrorlist/?country=${loc}&protocol=https&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -wn 2 - > $path/mlist
cat $path/mlist > /etc/pacman.d/mirrorlist

# installing
pacstrap -K /mnt base linux-lts linux-firmware amd-ucode
cat /tmp/mlist > /mnt/etc/pacman.d/mirrorlist
sed -i -e 's/#en_US.UTF-8/en_US.UTF-8/' -e "s/#$kbl.UTF-8/$kbl.UTF-8/" /mnt/etc/locale.gen
genfstab -U /mnt | sed 's/lz4/zstd:6,compress_chksum/' > /mnt/etc/fstab

cp $path/inchroot.sh /mnt/usr/bin
chmod 500 /mnt/usr/bin/inchroot.sh
arch-chroot /mnt /usr/bin/inchroot.sh "$name" "$password" "$zone"
rm -f /mnt/usr/bin/inchroot.sh

# post configuration
echo 'permit persist :wheel as root' > /mnt/etc/doas.conf
chmod 400 /mnt/etc/doas.conf
cp $path/fin.sh /mnt/usr/bin
chmod +x /mnt/usr/bin/fin.sh
echo 'arch' > /mnt/etc/hostname

cp $path/sys-configs/60-ioschedulers.rules /mnt/etc/udev/rules.d
cp $path/sys-configs/99-sysctl.conf /mnt/etc/sysctl.d
cat $path/sys-configs/arch.conf | sed "s/uuidv/$uuid/" > /mnt/boot/loader/entries/arch.conf
cat $path/sys-configs/arch.conf | sed -e "s/uuidv/$uuid/" -e 's/zen/zen-fallback/g' -e 's/Arch Linux/fallback initramfs/' > /mnt/boot/loader/entries/arch-fb.conf
cat $path/sys-configs/loader.conf > /mnt/boot/loader/loader.conf
cat $path/sys-configs/nanorc > /mnt/etc/nanorc
cp $path/sys-configs/zram-generator.conf /usr/lib/systemd

echo '- Goodbye ;)'
sleep 2
umount -R /mnt
systemctl poweroff
