#!/bin/bash

echo "# Creating cpio + lzma archive..."
cd initrd
find . | cpio -o -H newc | lzma -7 > ../initramfs.cpio.lzma
cd ..

echo "# Creating u-boot image..."
mkimage -A arm -O linux -T ramdisk -C lzma -a 0x00000000 -e 0x00000000 -n Ramdisk -d initramfs.cpio.lzma uRamdisk
rm -f initramfs.cpio.lzma

echo "# Done!"
