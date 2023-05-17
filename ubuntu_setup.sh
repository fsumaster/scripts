#!/bin/bash
echo #############################################################
echo #          FSUMASTER - [Ubuntu]-setup script - v1.4         #
echo #             tested on ubuntu 22.04 LTS                    #
echo #                                                           #
echo #                                                           #
echo #############################################################
echo         #"free your mind and your ass will follow"#

sudo apt-get update
echo Install packages
sudo apt-get install git bleachbit gufw p7zip-rar p7zip-full unace unrar zip unzip sharutils rar uudeview mpack arj cabextract file-roller gnome-tweaks curl

echo Setup and install brave browser
sudo apt install curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

echo Setup and install protonvpn
sudo add-apt-repository 'deb https://repo.protonvpn.com/debian unstable main'
sudo apt-get update
sudo apt-get install protonvpn

echo Enable ufw and start logging
sudo ufw enable
sudo ufw enable logging

echo Display hidden startup applications
sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop
echo #done#

sudo reboot
