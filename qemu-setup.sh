#!/bin/bash
#Virt-Manger qemu/kvm setup script for my desktop, Tested on ubuntu 21.04
# @fsumaster - rev 0.3 5.17.23
echo lets update first!
sudo apt update && sudo apt upgrade -y
sudo apt install -y qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager
echo lets get setup!

cd ~/Downloads 
git clone https://github.com/wabulu/Single-GPU-passthrough-amd-nvidia.git
cd Single-GPU-passthrough-amd-nvidia/ 

sudo bash ./setup.sh
sudo bash ./install_hooks.sh

echo adding user to group
sudo adduser `id -un` libvirt
sudo adduser `id -un` kvm
id $(whoami)
echo Done!