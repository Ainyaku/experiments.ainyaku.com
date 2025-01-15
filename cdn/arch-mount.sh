#!/bin/bash

# Command Syntax: curl -O https://experiments.ainyaku.com/cdn/arch-mount.sh && sh arch-mount.sh [Root partition name without /dev/] [Boot partition name without /dev/]

echo Root partition: $1
echo Boot partition: $2

mount -o noatime,space_cache=v2,compress=zstd,subvol=@ /dev/$1 /mnt
mkdir -p /mnt/{efi,home,swap}
mount -o noatime,space_cache=v2,compress=zstd,subvol=@home /dev/$1 /mnt/home
mount -o noatime,space_cache=v2,compress=zstd,subvol=@swap /dev/$1 /mnt/swap
mount /dev/$2 /mnt/efi
