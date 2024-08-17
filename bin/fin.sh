#!/usr/bin/env bash
flatpak install flathub org.mozilla.firefox com.discordapp.Discord io.mpv.Mpv org.gnome.Boxes org.telegram.desktop org.onlyoffice.desktopeditors com.transmissionbt.Transmission --noninteractive -y || exit 1
mkdir -p $HOME/{trash,atp}

gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-date false
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.shell favorite-apps "['org.mozilla.firefox.desktop', 'com.discordapp.Discord.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Console.desktop']"
gsettings set org.gnome.desktop.interface color-scheme prefer-dark

gsettings set org.gnome.desktop.privacy remove-old-temp-files true
gsettings set org.gnome.desktop.privacy remove-old-trash-files true

gsettings set org.gnome.nautilus.preferences recursive-search always
gsettings set org.gnome.nautilus.preferences show-image-thumbnails always
gsettings set org.gnome.nautilus.preferences show-directory-item-counts always

doas pacman -R totem epiphany gnome-tour --noconfirm
doas rm -f "$(realpath "$0")"
