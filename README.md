# Bobcat 300 Miner - Armbian Build

**Version:** v26.02 rolling  
**Hardware:** Bobcat 300 (RK3566)  
**Kernel:** Linux 6.18.4-current-rockchip64  

## Overview

Custom Armbian image for the Bobcat 300 Miner running on Rockchip RK3566 hardware.

## Installation

### Supported Models and Download Links
- [Bobcat 300 G280] 
- [Bobcat 300 G285](https://github.com/sicXnull/Bobcat-Armbian/releases/download/1.0/BobcatArmbian285.img.xz) 
- [Bobcat 300 G290]
- [Bobcat 300 G295]


### Flash to SD Card

**Linux:**
```bash
xz -d BobcatArmbian285.img.xz
sudo dd if=BobcatArmbian285.img of=/dev/sdX bs=4M status=progress conv=fsync
sync
```

**macOS:**
```bash
xz -d BobcatArmbian285.img.xz
diskutil list
diskutil unmountDisk /dev/diskX
sudo dd if=BobcatArmbian285.img of=/dev/rdiskX bs=4m
diskutil eject /dev/diskX
```

**Windows:**
- Use [Balena Etcher](https://www.balena.io/etcher/)
- Select `BobcatArmbian285.img.xz` and your SD card
- Click Flash

Replace `/dev/sdX` (or `/dev/diskX`) with your actual SD card device.

## First Boot

**Default Login:**
- Username: `root`
- Password: `1234`

You will be prompted to change the password and create a new user on first login.

## Access

```bash
# SSH to device
ssh root@<device-ip>

# Update system
apt update && apt upgrade -y
```

---

**Image:** BobcatArmbian285.img.xz
