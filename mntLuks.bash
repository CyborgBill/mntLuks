#!/bin/bash
# Mount external LUKS encrypted HDDs

# define friendly names for mounting
dirs=("dd" "ld")

#make key value pairs for use in loop
declare -A devs=( ["dd"]="sdb1" ["ld"]="sda1")

#do the dance
for dir in "${dirs[@]}"
do
sudo mkdir /media/"$dir"
sudo cryptsetup luksOpen /dev/"${devs[$dir]}" "$dir"
sudo mount /dev/mapper/"$dir" /media/"$dir"
done
exit 0
