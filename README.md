# y2ai

Yet Another Arch Installer
![](https://raw.githubusercontent.com/nedorazrab0/test/main/20241212_15h13m26s_grim.png)

## Features

- [Hyprland](./cfg/etc/hypr)
- btrfs
- linux-zen
- [systemd-boot](./cfg/boot)
- Secure Boot
- [Some scripts](#scripts)
- [Some tweaks](#tweaks)

> Please do not make btrfs snapshots

## Installation

Clean install only!

```shell
bash -c "$(curl -f 'https://raw.githubusercontent.com/nedorazrab0/y2ai/main/ins')"
```

> [Arch9660](https://github.com/nedorazrab0/arch9660)
> [ArchISO](https://archlinux.org/download)

### After install

Log in and type `h` to launch Hyprland!

## Requirements

- AMD CPU
- AMD GPU
- SSD

## Tweaks

- [blk io](./cfg/etc/udev/rules/60-ioschedulers.rules)
- [sysctl](./cfg/etc/sysctl.d/99-cust.conf)
- [Root mount options](./cfg/boot/loader/entries/arch-zen.conf)
- [`/boot` mount options](./cfg/etc/systemd/system/boot.mount.d/mount-options.conf)
- [Zram](./cfg/etc/systemd/zram-generator.conf.d/zram.conf)
- [Other Systemd settings](./cfg/etc/systemd)

## Scripts

| Script | Function |
| ------ | -------- |
| [`atp`](./cfg/usr/local/bin/atp) | Transport files via adb |
| [`bootctl-update`](./cfg/usr/local/bin/bootctl-update) | Update `systemd-boot` with Secure Boot enabled |
| [`dtc`](./cfg/usr/local/bin/dtc) | Detach a thumb drive |
| [`kp`](./cfg/usr/local/bin/kp) | Elevate privileges |
| [`fin`](./cfg/usr/local/bin/fin) | Install some flatpaks |
| [`fls`](./cfg/usr/local/bin/fls) | Flash a drive |
| [`frt`](./cfg/usr/local/bin/frt) | Format a partition |
| [`h`](./cfg/usr/local/bin/h) | Launch Hyprland |
| [`l`](./cfg/usr/local/bin/l) | `ls` alias |
| [`hostnamegen`](./cfg/usr/local/bin/hostnamegen) | Generate hostname or SSID |
| [`emailgen`](./cfg/usr/local/bin/emailgen) | Generate an email address |
| [`mk`](./cfg/usr/local/bin/mk) | Launch Micro |
| [`mnt`](./cfg/usr/local/bin/mnt) | Mount a blk |
| [`pk`](./cfg/usr/local/bin/pk) | Flatpak aliases |
| [`pm`](./cfg/usr/local/bin/pm) | Short Pacman |
| [`pwg`](./cfg/usr/local/bin/pwg) | Generate passwords |
| [`scr`](./cfg/usr/local/bin/scr) | Make a screenshot |
| [`sd`](./cfg/usr/local/bin/sd) | Systemctl aliases |
| [`wlc`](./cfg/usr/local/bin/wlc) | Make a wireless adb connect |
| [`wqc`](./cfg/usr/local/bin/wqc) | Connect WIFI |
