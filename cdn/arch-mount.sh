#!/bin/bash

# Command Syntax: curl https://experiments.ainyaku.com/cdn/arch-mount.sh | sh

echo Detected partitions:
lsblk
echo
echo Enter the name of the root partition \(without "/dev/"\):
read part

echo
echo Root partition: $part
echo Boot partition: ${part::-1}1

echo
mount -o noatime,space_cache=v2,compress=zstd,subvol=@ /dev/$part /mnt
mkdir -p /mnt/{efi,home,swap}
mount -o noatime,space_cache=v2,compress=zstd,subvol=@home /dev/$part /mnt/home
mount -o noatime,space_cache=v2,compress=zstd,subvol=@swap /dev/$part /mnt/swap
mount /dev/${part::-1}1 /mnt/efi
