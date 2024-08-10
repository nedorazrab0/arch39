#!/usr/bin/env bash
echo '- CHROOT'

locale-gen
hwclock --systohc
timedatectl set-timezone "$3"
sed -i -e 's/#NTP=/NTP=/' -e 's/#FallbackNTP/FallbackNTP=time.google.com/'
timedatectl set-ntp true

useradd -mg users -G wheel "$1"
echo "$1:$2" | chpasswd

systemctl enable systemd-networkd wpa_supplicant gdm systemd-timesyncd
systemctl disable avahi-daemon
systemctl mask avahi-daemon

bootctl install --esp-path=/boot
echo '- Exiting chroot'
exit
