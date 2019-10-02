#!/bin/sh
# get raspberrypi in usable state on default apkovl

service modloop stop

mount -o remount,rw /media/mmcblk0p1

setup-interfaces -i << EOF
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp
	hostname localhost
EOF

service networking start

setup-ntp -c chrony

setup-apkrepos -1

setup-apkcache /media/mmcblk0p1/apks

setup-lbu /etc/apk/cache/config-backups

apk add nano
apk add man mkinitfs-doc
apk add mkinitfs

apk add make git less
