#!/usr/bin/env bash
set -e
path='/tmp/njk'

# install configurating
kbl='#'
read -p '- Username: ' name
read -sp '- Password: ' password; echo
read -p '- Locale (en_US is preinstalled): ' kbl
read -p '- Timezone (e.g. Europe/Moscow): ' zone
read -p '- Target disk name: ' disk
read -p '- Do you want to destroy your own disk? (y/n): ' agreement

case "$agreement" in
    y) true;;
    n) exit 0;;
    *) exit 1;;
esac

# disk tuning
sysctl -w 'vm.vfs_cache_pressure = 150'
sysctl -w 'vm.dirty_bytes = 268435456'
sysctl -w 'vm.dirty_background_bytes = 134217728'
sysctl -w 'vm.dirty_writeback_centisecs = 1500'

echo 'none' > /sys/block/$disk/queue/scheduler
echo '128' > /sys/block/$disk/queue/nr_requests
echo '2' > /sys/block/$disk/queue/rq_affinity

# disk partition
echo '- You have 2 seconds to save your disk!'
sleep 2
cd /
umount -v /dev/$disk* || true
umount -vR /mnt || true
echo '- Disk partitioning...'
sgdisk -Zo -n1::+64M -t1:ef00 -c1:'EFI System Partition' \
           -n2::+ -t2:8304 -c2:'Arch Linux Root' -p /dev/$disk

mkfs.fat -vF32 -S512 -n 'ESP' --codepage=437 /dev/$disk*1
mkfs.btrfs -fKL 'archlinux' -n65536 -m single /dev/$disk*2

mount -t btrfs -o 'noatime,nodiscard,ssd,compress=zstd:3' /dev/$disk*2 /mnt
mount -t vfat --mkdir=600 -o 'noexec,nosuid,noatime,umask=0177' /dev/$disk*1 /mnt/boot

# installing
pacstrap -KP /mnt base linux-zen booster linux-firmware amd-ucode \
                  btrfs-progs f2fs-tools xfsprogs exfatprogs dosfstools gptfdisk \
                  android-tools opendoas git bash-completion {un,}zip gnome-boxes flatpak zram-generator nano reflector \
                  hyprland polkit xdg-desktop-portal-hyprland mako kitty noto-fonts waybar brightnessctl \
                  grim slurp vulkan-radeon libva-mesa-driver bluez{,-utils} pipewire{,-alsa,-pulse,-jack}
echo "en_US.UTF-8 UTF-8\n${kbl}.UTF-8 UTF-8" /mnt/etc/locale.gen

mount --bind "$path" /mnt/mnt
arch-chroot /mnt bash /mnt/inchroot.sh "$name" "$password" "$zone"

# post configuration
cat $path/sys-configs/config.jsonc > /mnt/etc/xdg/waybar/style.css
cat $path/sys-configs/config.jsonc > /mnt/etc/xdg/waybar/config.jsonc
cp $path/sys-configs/hyprland.conf /mnt/etc/hyprland.conf

mkdir -p /etc/systemd/system/systemd-networkd-wait-online.service.d
echo '[Service]\nExecStart=\nExecStart=/usr/lib/systemd/systemd-networkd-wait-online --any' \
     > /etc/systemd/system/systemd-networkd-wait-online.service.d/wait-for-only-one-interface.conf

echo 'permit persist :wheel' > /mnt/etc/doas.conf
chmod 400 /mnt/etc/doas.conf
echo 'nedocomp' > /mnt/etc/hostname
echo 'DefaultTimeoutStopSec=5s' >> /mnt/etc/systemd/system.conf
cat /etc/systemd/timesyncd.conf > /mnt/etc/systemd/timesyncd.conf
cat /etc/xdg/reflector/reflector.conf > /mnt/etc/xdg/reflector/reflector.conf

cp $path/bin/{atp,wlc,wqc,mnt,scr,fin.sh,h} /mnt/usr/bin
chmod +x /mnt/usr/bin/{atp,wlc,wqc,mnt,scr,fin.sh,h}

cp $path/sys-configs/arch-zen.conf /mnt/boot/loader/entries/arch-zen.conf
cp $path/sys-configs/{20-wired,25-wireless}.network /mnt/etc/systemd/network
cp $path/sys-configs/60-ioschedulers.rules /mnt/etc/udev/rules.d
cp $path/sys-configs/99-sysctl.conf /mnt/etc/sysctl.d
cp $path/sys-configs/zram-generator.conf /mnt/etc/systemd
cat $path/sys-configs/loader.conf > /mnt/boot/loader/loader.conf
cat $path/sys-configs/nanorc > /mnt/etc/nanorc

echo '- Goodbye ;)'
sleep 2
fstrim -v /mnt
umount -R /mnt
systemctl poweroff
