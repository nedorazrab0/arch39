#!/usr/bin/env bash

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

lsblk -o name,vendor,model,size,label,type,rm,serial,tran
read -p '- Disk name: ' disk
sleep 1
umount /dev/$disk*
wipefs --all /dev/$disk
echo -e 'label:gpt\n,1G,U,-,\n,+,\n' | sfdisk /dev/$disk

mkfs.fat -F32 -n 'ESP' /dev/$disk*1
mkfs.f2fs -fil 'arch' -O extra_attr,inode_checksum,sb_checksum,compression /dev/$disk*2

umount -R /mnt
mount /dev/$disk*2 /mnt
mkdir -p /mnt/boot
mount /dev/$disk*1 /mnt/boot

sed -i -e 's/#ParallelDownloads = 5/ParallelDownloads = 15/' -e 's/#Colors/Colors/' -e 's/#VerbosePkgLists/VerbosePkgLists/' /etc/pacman.conf
pacman -Sy
pacman -S pacman-contrib --noconfirm
curl "https://archlinux.org/mirrorlist/?country=${loc}&protocol=https&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -wn 2 - > /tmp/mlist
cat /tmp/mlist > /etc/pacman.d/mirrorlist

pacstrap -K /mnt base linux-lts linux-firmware amd-ucode
cat /tmp/mlist > /mnt/etc/pacman.d/mirrorlist
echo 'permit persist :wheel as root' > /mnt/etc/doas.conf
chmod 400 /mnt/etc/doas.conf
echo 'arch' > /mnt/etc/hostname
sed -i -e 's/#en_US.UTF-8/en_US.UTF-8/' -e "s/#$kbl.UTF-8/$kbl.UTF-8/" /mnt/etc/locale.gen
genfstab -Up /mnt | sed 's/lz4/zstd:6,compress_chksum/' > /mnt/etc/fstab

curl -o /mnt/tmp/inchroot.sh https://raw.githubusercontent.com/nedorazrab0/test/main/inchroot.sh
chmod 500 /mnt/tmp/inchroot.sh
arch-chroot /mnt /tmp/inchroot.sh "$name" "$password" "$zone"
rm -f /mnt/tmp/inchroot.sh

cp ./fin.sh /mnt/usr/bin
chmod +x /mnt/usr/bin/fin.sh
echo 'Goodbye ;)'
sleep 1
umount -R /mnt
poweroff
