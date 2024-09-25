#!/usr/bin/env bash

if (( "$(id -u)" != 0 )); then
    echo '! Run it as root'
    exit 1
fi

disk="$2"
for blk in $disk?*; do
    fs="$(blkid -s TYPE -o value $blk)"
    case "$1" in
        's')
            case "$fs" in
                'btrfs') amo='ssd,nodiscard,compress=zstd:3';;
                'f2fs') amo='nodiscard,compress_chksum';;
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
                'f2fs') amo='nodiscard,compress_chksum';;
                'exfat|vfat') amo='noexec,nosuid,dmask=0122,fmask=0133';;
            esac
            ;;
        'x') :;;
    esac

    uuid="$(blkid -s UUID -o value $blk)"
    mkdir -p "/run/mnt/$2/fs-${uuid}"
    mount -vo "notime,${amo}" "$blk" "/run/mnt/$2/fs-${uuid}"
done
