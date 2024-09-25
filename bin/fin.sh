#!/usr/bin/env bash
mkdir -p $HOME/{trash,atp}

flatpak install flathub org.mozilla.firefox com.discordapp.Discord io.mpv.Mpv org.gnome.Boxes org.telegram.desktop org.onlyoffice.desktopeditors com.transmissionbt.Transmission org.kde.krita --noninteractive -y

doas rm -f /usr/share/applications/{qv4l2,qvidcap,bvc,bssh,avahi-discover}.desktop "$(realpath "$0")"
