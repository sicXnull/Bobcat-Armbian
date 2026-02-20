
# Bobcat 300 Miner – Armbian Build

**Version:** v26.02 rolling  
**Hardware:** Bobcat 300 (RK3566)  
**Kernel:** Linux 6.18.4-current-rockchip64  

---

## Overview

Custom **Armbian** image for the **Bobcat 300 Miner** running on **Rockchip RK3566** hardware.

⚠️ **Important:** Boot behavior differs by model.  
Please read the correct section below for your device.

---

## Supported Models & Downloads

- **Bobcat 300 G280** – _Coming soon_

- **Bobcat 300 G285 (SD Boot Version)**  
  https://github.com/sicXnull/Bobcat-Armbian/releases/download/1.0/BobcatArmbian285.img.xz  

- **Bobcat 300 G290 (eMMC Flasher)**  
  [https://github.com/sicXnull/Bobcat-Armbian/releases/download/1.0/Bobcat29X_EMMC_Flasher.img](https://github.com/sicXnull/Bobcat-Armbian/releases/download/1.0/Bobcat29X_EMMC_Flasher.img.xz)  

- **Bobcat 300 G295 (eMMC Flasher)**  
  [https://github.com/sicXnull/Bobcat-Armbian/releases/download/1.0/Bobcat29X_EMMC_Flasher.img](https://github.com/sicXnull/Bobcat-Armbian/releases/download/1.0/Bobcat29X_EMMC_Flasher.img.xz) 

---

# G285 – SD Card Boot (No eMMC Flash Required)

The **G285 boots and runs entirely from the SD card.**  
Nothing is written to internal eMMC.

---

## Installation (G285)

### 1️⃣ Flash the Image to SD Card

### Linux

```bash
xz -d BobcatArmbian285.img.xz
sudo dd if=BobcatArmbian285.img of=/dev/sdX bs=4M status=progress conv=fsync
sync
```

### macOS

```bash
xz -d BobcatArmbian285.img.xz
diskutil list
diskutil unmountDisk /dev/diskX
sudo dd if=BobcatArmbian285.img of=/dev/rdiskX bs=4m
diskutil eject /dev/diskX
```

### Windows

Use **Balena Etcher**:

1. Select `BobcatArmbian285.img.xz`  
2. Select your SD card  
3. Click **Flash**

---

### 2️⃣ Boot Device

1. Power off the Bobcat  
2. Insert SD card  
3. Power on device  
4. System will boot directly from SD card  

✔ No eMMC flashing  
✔ No waiting process  
✔ Safe & reversible (remove SD to restore stock)

---

# G290 / G295 – eMMC Flasher Image

The **G290 and G295 use a flasher image**.

This image boots from SD and automatically flashes Armbian to internal eMMC.

⚠️ This will overwrite the internal OS.

---

## Installation (G290 / G295)

### 1️⃣ Burn Image to SD Card

Flash:

```
Bobcat29X_EMMC_Flasher.img
```

Use:

- Linux `dd`
- macOS `dd`
- Windows (Balena Etcher)

---

### 2️⃣ Flash eMMC

1. Power off the Bobcat  
2. Insert SD card  
3. Power on the device  
4. The device will automatically begin flashing eMMC  
5. **Wait up to 10 minutes**  
6. The LED will begin flashing when complete  

⚠️ Do **NOT** power off during flashing

---

### 3️⃣ After Flash Completes

1. Power off the device  
2. Remove SD card  
3. Power on again  
4. System now boots from internal eMMC  

---

# First Boot

**Default Login:**

```
Username: root
Password: 1234
```

You will be prompted to:

- Change root password  
- Create a new user  

---

# Access

```bash
ssh root@<device-ip>

apt update && apt upgrade -y
```

---

# Helium Installation

```bash
wget https://raw.githubusercontent.com/sicXnull/Bobcat-Armbian/refs/heads/main/install_helium.sh

chmod +x install_helium.sh

./install_helium.sh
```

---

## Notes

- G285 → Runs fully from SD card  
- G290 / G295 → SD card flashes eMMC  
- First boot may take several minutes  

---
