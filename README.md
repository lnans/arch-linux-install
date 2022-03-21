# Description

This script provides minimal configuration for Arch Linux installation with GNOME.
>This script must be run only on fresh install.

# Installation

### ISO Download and USB tool

> ISO : [http://mir.archlinux.fr/iso/latest/](http://mir.archlinux.fr/iso/latest/) \
> Rufus : [https://github.com/pbatard/rufus/releases](https://github.com/pbatard/rufus/releases)

### Arch install initialization

```bash
# If WIFI connection needed
iwctl
device list
station interface scan
station interface get-networks
station interface connect "SSID"

# Configure lang
loadkeys fr-latin1
timedatectl set-ntp true
timedatectl status

# Disk configuration
fdisk -l
fdisk /dev/sda

##############################################
# g -> create GPT partition
# n -> new EFI partition (1, default, +550M)
# n -> new SWAP partition (2, default, +4G)
# n -> new EXT partition (3, default, default)
# t -> change partition type (1, 1 EFI)
# t -> change partition type (2, 19 SWAP)
# w -> Write and exit
##############################################

mkfs.fat -F32 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2
mkfs.ext4 /dev/sda3

# Mount and copy arch files
mount /dev/sda3 /mnt
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
```

### Arch Configuration
```bash
pacman -S git
git clone https://github.com/lnans/arch-linux-install /tmp/installation
./tmp/installation/install.sh
exit
umount -l /mnt
shutdown now
```