#!/usr/bin/env bash

if [[ "$@" =~ '--help' ]]; then
    echo '- Use it to mount your disks'
    echo "  Usage: $0 [option] [disk]"
    echo "         $0 s sdd"
    echo '- Options:'
    echo '  s    Mount a SSD'
    echo '  h    Mount a HDD'
    echo '  u    Mount a thumb drive'
    echo '  x    Detach a disk'
    echo '- Mount path: "/run/dev/[disk]"'
fi

if (( "$(id -u)" != 0 )); then
    echo '! Run it as root'
    exit 1
fi

for blk in /dev/$2*[0-9]*; do
    fs="$(blkid -s TYPE -o value $blk)"
    case "$1" in
        's')
            case "$fs" in
                'btrfs') amo='ssd,nodiscard,compress=zstd:3';;
                'f2fs') amo='nodiscard,compress_algorithm=zstd:3,compress_chksum';;
            esac
            ;;
        'h')
            case "$fs" in
                'btrfs') amo='nossd,autodefrag,nodiscard,compress=zstd:6';;
                *) amo='lazytime';;
            esac
            ;;
        'u')
            case "$fs" in
                'btrfs') amo='ssd_spread,nodiscard,compress=zstd:3';;
                'f2fs') amo='nodiscard,compress_algorithm=zstd:3,compress_chksum';;
                exfat|vfat) amo='noexec,nodev,nosuid,umask=0022';;
            esac
            ;;
        'x') x='true';;
    esac

    if [[ -z "$x" ]]; then
        mkdir -p "/run$blk"
        mount -vo "noatime,${amo}" "$blk" "/run$blk"
    else
        umount -v --onlyonce "$blk"
    fi
done

if [[ -n "$x" ]]; then
    echo '1' > "/sys/block/$2/device/delete"
    rm -rf "/run/$blk"
fi
