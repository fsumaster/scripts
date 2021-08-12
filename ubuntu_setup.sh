#!/bin/bash
#Script for my perfect Ubuntu setup v1.1
echo #############################################################
echo #             FSUMASTER - setup script - v1.2               #
echo #             tested on ubuntu 16.04-21.04 LTS              #
echo #                                                           #
echo #                                                           #
echo #############################################################
echo         #"free your mind and your ass will follow"#

sudo apt-get update
echo #swervin - installing apps#
sudo apt-get install git bleachbit gufw p7zip-rar p7zip-full unace unrar zip unzip sharutils rar uudeview mpack arj cabextract file-roller

sudo ufw enable
sudo ufw enable logging

#echo #swervin - installing openvpn #
#sudo apt-get install network-manager-openvpn network-manager network-manager-gnome network-manager-openvpn-gnome
#sudo service network-manager restart

echo #swervin - display hidden startup applications#
sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop
echo #done#

#echo #swervin - changing swappiness#
#echo ###current value###
#cat /proc/sys/vm/swappiness
#echo ###changing it to 10###
#sudo sysctl vm.swappiness=10
#echo ###to change this permanently add vm.swappiness=10 to the bottom###
#sudo gedit /etc/sysctl.conf
#sleep 5s

echo #swervin - updating to finish removing and updating#
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade

uname-a
w

sudo reboot
