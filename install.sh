#!/usr/bin/env bash
path='/tmp/njk'

rm -rf "$path"
mkdir -p "$path"
curl -o $path/setup.tar.xz 'https://raw.githubusercontent.com/nedorazrab0/arch-install/main/setup.tar.xz'
tar -xJf $path/setup.tar.xz -C "$path"
rm -f $path/setup.tar.xz

bash "$path/main.sh"
