## Readme.md

> This is a collection of misc scripts I use for various tasks, fresh installs,  and QOL


**Setup Scripts**

- __*qemu-setup: This is for gpu passthrough*__

Description: This script is designed for qemu/virt manager on ubuntu running 2 gpus. It checks for updates and updates if needed, It installs required packages, adds your current user to kvm & libvirt groups, clones [pavolelsigs gpu passthrough script (credit to him)](http://https://github.com/pavolelsig/passthrough_helper_ubuntu_20.git "pavolelsig's gpu passthrough script") and runs the install.

Prerequisites: A cpu, motherboard that allows iommu, two gpu's (1 for host 1 for guest to passthrough) running ubuntu base OS 

> chmod +x qemu-setup.sh
./qemu-setup.sh



-  __*ubuntu_setup: This is for fresh install for ubuntu*__

Description: A simple installer script I use for fresh installing ubuntu to my liking.

Prerequisites: A pc running ubuntu base OS

> chmod +x ubuntu_setup.sh
./ubuntu_setup.sh./ubuntu_setup.sh



- __*Windows hardening script*__

Description: This allows you to remove/add features back to your OS and harden the base installation of windows to your liking. Uncomment lines you'd like to take effect, Comment for lines you want to keep.

Prerequisites: You need to have a administrator account

> Run Windows PowerShell ISE as admin and edit the script to your liking and execute.


