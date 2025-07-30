# Arch39

arch linux installer

<img src="https://raw.githubusercontent.com/nedorazrab0/test/main/huii/10393608080-part.webp" style="width: 720px;" alt="Screenshot" loading="lazy">

## Resources

- [systemd-boot configs](./cfg/boot/loader)
- [hyprland configs](./cfg/etc/hypr)
- [micro configs](./cfg/etc/micro)
- [sysctl configs](./cfg/etc/sysctl.d)
- [systemd configs](./cfg/etc/systemd)
- [udev rules](./cfg/etc/udev/rules.d)
- [bluez config](./cfg/etc/wireplumber/wireplumber.conf.d/bluez.conf)
- [waybar configs](./cfg/etc/xdg/waybar)
- [zsh configs](./cfg/etc/zsh)
- [alacritty config](./cfg/etc/alacritty.toml)
- [pacman config](./cfg/etc/pacman.conf)
- [pacman mirrorlist](./cfg/etc/pacman.d/mirrorlist)
- [scripts dir](./cfg/usr/local/bin)

## Installation

1) I did it for myself
2) amd + ssd only
3) clean install only

Enter this code in your archiso to download the [installation script](./main):

```shell
bash -c "$(curl -f 'https://raw.githubusercontent.com/nedorazrab0/arch39/main/ins')"
```

Then exec it

```shell
bash /tmp/arch39/main [-h] -n USERNAME -t TIMEZONE -l LAYOUT -d DISK -f FIRMWARE
```

miku miku beam
