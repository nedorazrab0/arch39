# y2ai
Yet Another Arch Installer

## Features
- [Hyprland](https://hyprland.org)
- btrfs
- linux-zen
- Secure Boot
- [Some scripts](#scripts)
- [Some tweaks](#tweaks)

Please do not make btrfs snapshots

## Usage
### Installation
Clean install only!
```shell
bash -c "$(curl -f 'https://raw.githubusercontent.com/nedorazrab0/y2ai/main/ins')"
```
> [ArchISO](https://archlinux.org/download)

### After install
Log in and type `h` to launch Hyprland!

## Requirements
- AMD CPU
- AMD GPU
- SSD

<a name="tweaks"></a>
## Tweaks
- [blk io](./cfg/60-ioschedulers.rules)
- [sysctl](./cfg/99-sysctl.conf)
- [Root mount options](./cfg/arch-zen.conf)
- [`/boot` mount options](./cfg/mount-options.conf)
- [zram](./cfg/zram-generator.conf)

<a name="scripts"></a>
## Scripts
| Script | Function |
| ------ | -------- |
| [`atp`](./bin/atp) | Transport files via adb |
| [`bootctl-update`](./bin/bootctl-update) | Update `systemd-boot` with Secure Boot enabled |
| [`fin`](./bin/fin) | Install some flatpaks |
| [`fls`](./bin/fls) | Flash a drive |
| [`frt`](./bin/frt) | Format a partition |
| [`h`](./bin/h) | Launch Hyprland |
| [`hostnamegen`](./bin/hostnamegen) | Generate hostname or SSID |
| [`mk`](./bin/mk) | Launch Micro |
| [`mnt`](./bin/mnt) | Mount a disk |
| [`pk`](./bin/pk) | Flatpak aliases |
| [`pm`](./bin/pm) | Short Pacman |
| [`pwg`](./bin/pwg) | Generate passwords |
| [`scr`](./bin/scr) | Make a screenshot |
| [`sd`](./bin/sd) | Systemctl aliases |
| [`wlc`](./bin/wlc) | Make a wireless adb connect |
| [`wqc`](./bin/wqc) | Connect WIFI |
