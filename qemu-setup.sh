#!/bin/bash
#Virt-Manger qemu/kvm setup script for my desktop, Tested on ubuntu 21.04
# @fsumaster - rev 0.2 4.19.22
echo lets update first!
sudo apt update && sudo apt upgrade -y

echo lets get setup!


echo installing virt-manager
sudo apt install -y qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager

echo adding user to group
sudo adduser `id -un` libvirt
sudo adduser `id -un` kvm
id $(whoami)
echo Done!

echo -------------
echo Clone helper
echo -------------
# Big thanks too https://www.youtube.com/watch?v=C2jnUK4MSyE
git clone https://github.com/pavolelsig/passthrough_helper_ubuntu_20.git && cd passthrough_helper_ubuntu*
sleep 3
chmod +x gpu_passthrough.sh
sleep 1
bash gpu_passthrough.sh

#find a better way to wait for the script to complete.
sleep 10 

lspci -nnk | grep -iE "(usb 3|amd)" |& tee ~/Desktop/gpu-id.log
echo "quiet splash amd_iommu=on kvm.ignore_msrs=1 iommu=pt kvm.ignore_msrs=1 vfio_iommu_type1.allow_unsafe_interrupts=1 rd.driver.pre=vfio-pci vfio-pci.ids=1002:67df,1002:aaf0" > grub.text
# replace vfio_pci.ids with your gpu ids
