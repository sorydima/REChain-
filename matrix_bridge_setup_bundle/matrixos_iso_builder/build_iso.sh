#!/bin/bash
ISO_NAME="MatrixOS-$(date +%Y%m%d).iso"
BUILD_DIR="./iso_root"

mkdir -p "$BUILD_DIR/boot/grub"
cp grub.cfg "$BUILD_DIR/boot/grub/"

# Simulated kernel/initrd copy (user should replace)
touch "$BUILD_DIR/boot/vmlinuz"
touch "$BUILD_DIR/boot/initrd.img"

echo "[*] Creating ISO: $ISO_NAME"
mkisofs -o "$ISO_NAME" -b boot/grub/grub.cfg -no-emul-boot -boot-load-size 4 -boot-info-table "$BUILD_DIR"
echo "[✓] Done"
