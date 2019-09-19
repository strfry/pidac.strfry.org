#!/bin/sh

branch=latest-stable
arch=x86_64
repo=http://dl-cdn.alpinelinux.org/alpine/${branch}
flavor=vanilla

# TODO: getopt here
overlay="$1"

#[ -n "$overlay" ] || (
#)

#kernel=$(mktemp)
#initrd=$(mktemp)

initrd=initramfs-${overlay}

#wget -O "$kernel" "${repo}/releases/${arch}/netboot/vmlinuz-${flavor}"
wget -O "$initrd" "${repo}/releases/${arch}/netboot/initramfs-${flavor}"

[ -n "$overlay" ] && (
  overlay=.
  cd "${overlay%/*}"
  echo "${overlay##*/}" | cpio -H newc -o
) | gzip >> "$initrd"

modloop="${repo}/releases/${arch}/netboot/modloop-${flavor}"
append="console=ttyS0,115200 alpine_repo=${repo}/main modules=loop,squashfs,virtio_net modloop=${modloop} quiet"

if [ -n "$overlay" ]; then
  append="$append apkovl=/${overlay##*/}"
fi


