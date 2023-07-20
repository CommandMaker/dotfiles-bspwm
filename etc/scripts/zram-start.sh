#!/bin/bash
modprobe zram
echo zstd > /sys/block/zram0/comp_algorithm
echo 17179869184 > /sys/block/zram0/disksize
mkswap -L zramswap /dev/zram0
swapon -p 100 /dev/zram0
