#!/bin/bash

# Elliot Schot - 2020

# Script aimed to help pass a disk directly to a VM

varversion=1.0
#V1.0: Initial Release - proof of concept


# USAGE
# You can run this scritp directly using:
# wget https://raw.githubusercontent.com/xphir/proxmox/master/onboard-gpu-passthrough.sh
# chmox +x drive-passtrough.sh
# ./drive-passtrough.sh

echo "----------------------------------------------------------------"
echo "Elliot Schot - 2020"
echo "Proxmox Onboard GPU Passthrough"
echo "----------------------------------------------------------------"

# TODO: Check bootloader type grub vs systemd-boot (it currently only supports system boot

# Add lines to systemd-boot
echo " intel_iommu=on i915.enable_gvt=1" >> greetings.txt
echo "enabled IOMMU & Inel GVT-g"

# Add Kernel Modules (for /etc/modules)
echo "
# Modules required for PCI passthrough
vfio
vfio_iommu_type1
vfio_pci
vfio_virqfd

# Modules required for Intel GVT
kvmgt
exngt
vfio-mdev
" >> /etc/modules

echo "Added Kernel Modules"

# Refresh initramfs
update-initramfs -u -k all

echo "Refreshed Iitramfs"

# Reboot
reboot
