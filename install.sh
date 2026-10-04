#!/bin/sh
set -eu

theme_dir="/boot/grub/themes/grub-prpl"

rm -rf "$theme_dir"
mkdir -p "$theme_dir"
cp -r ./*.pf2 ./*.png ./theme.txt "$theme_dir"/

if grep -q '^GRUB_THEME=' /etc/default/grub; then
	sed -i 's|^GRUB_THEME=.*|GRUB_THEME="/boot/grub/themes/grub-prpl/theme.txt"|' /etc/default/grub
else
	printf '\nGRUB_THEME="/boot/grub/themes/grub-prpl/theme.txt"\n' >> /etc/default/grub
fi

if grep -q '^GRUB_TIMEOUT=' /etc/default/grub; then
	sed -i 's|^GRUB_TIMEOUT=.*|GRUB_TIMEOUT=10|' /etc/default/grub
else
	printf 'GRUB_TIMEOUT=10\n' >> /etc/default/grub
fi
