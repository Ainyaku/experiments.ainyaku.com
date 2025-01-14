#!/bin/bash

mount -o noatime,space_cache=v2,compress=zstd,subvol=@ /dev/$1 /mnt
mkdir -p /mnt/{efi,home,swap}
mount -o noatime,space_cache=v2,compress=zstd,subvol=@home /dev/$1 /mnt/home
mount -o noatime,space_cache=v2,compress=zstd,subvol=@swap /dev/$1 /mnt/swap
mount /dev/${1::-1}1 /mnt/efi
