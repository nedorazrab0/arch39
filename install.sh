#!/usr/bin/env bash
read -p '- Coutry (for mirrors): ' loc

# pacman configuration
sed -i -e 's/#ParallelDownloads = 5/ParallelDownloads = 15/' -e 's/#Color/Color/' -e 's/#VerbosePkgLists/VerbosePkgLists/' /etc/pacman.conf
pacman -Sy archlinux-keyring --noconfirm
echo '- Configuring mirrors...'
reflector --country "$loc" --protocol https --last 2 --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syy git --noconfirm
git clone https://github.com/nedorazrab0/arch-install /tmp/njk

bash /tmp/njk/main.sh
