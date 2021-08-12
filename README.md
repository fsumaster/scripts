<center><b>Setup Scripts</b>

<i><u>qemu-setup: This is for gpu passthrough</i></u></center> 

<b>Prerequisites are a cpu and motherboard that allows iommu, two gpu's (1 for host 1 for guest to passthrough)</b>

chmod +x qemu-setup.sh<br>
./qemu-setup.sh<br>
run this script and grab your gpu id's from the setup script output "gpu-id.log" and you'll need to save those id's and add that to your grub.

<br>
<br>

<center><i><u>ubuntu_setup: This is for fresh install for ubuntu</i></u></center>

Prerequisites are a pc running ubuntu

chmod +x ubuntu_setup.sh <br>
./ubuntu_setup.sh <br>
run this script and you're all set.
