#!/usr/bin/env bash
read -p '- Coutry (for mirrors): ' loc

path='/tmp/njk'
# pacman configuration
sed -i -e 's/#ParallelDownloads = 5/ParallelDownloads = 15/' -e 's/#Color/Color/' -e 's/#VerbosePkgLists/VerbosePkgLists/' /etc/pacman.conf
pacman -Sy archlinux-keyring --needed --noconfirm
echo '- Configuring mirrors...'
reflector --country "$loc" --protocol https --latest 2 --sort rate --save /etc/pacman.d/mirrorlist || exit 1
pacman -Syy git --noconfirm
rm -rf "$path"
git clone https://github.com/nedorazrab0/arch-install "$path"

bash "$path/main.sh"
