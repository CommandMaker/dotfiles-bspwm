#!/bin/bash
swapoff /dev/zram0
echo 1 > /sys/block/zram0/reset
rmmod zram