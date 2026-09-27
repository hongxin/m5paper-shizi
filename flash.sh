#!/bin/bash
# 手动烧录脚本 — 用法: ./flash.sh /dev/cu.usbserial-XXXXX
set -e
PORT="${1:?用法: ./flash.sh /dev/cu.usbserial-XXXXX}"
cd "$(dirname "$0")"
esptool.py --chip esp32 -p "$PORT" -b 460800 \
  --before default_reset --after hard_reset write_flash \
  0x1000    firmware/bootloader_0x1000.bin \
  0x8000    firmware/partitions_0x8000.bin \
  0x10000   firmware/shizi_card_0x10000.bin \
  0x310000  firmware/shizi_0x310000.bin \
  0xb80000  firmware/pinyin_0xb80000.bin
echo "完成 ✔"
