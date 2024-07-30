#!/usr/bin/env bash
path='/tmp/njk'

mkdir -p "$path"
curl -o $path/setup.txz 'https://raw.githubusercontent.com/nedorazrab0/arch-install-test/main/setup.txz'
tar -xJf $path/setup.txz -C "$path"
rm -f $path/setup.txz

bash "$path/main.sh"
