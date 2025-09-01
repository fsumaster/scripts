#!/bin/bash
echo "#############################################################"
echo "#          FSUMASTER - [Ubuntu]-setup script - v1.8         #"
echo "#             tested on Ubuntu 22.04 LTS                    #"
echo "#############################################################"
echo "\"free your mind and your ass will follow\""

# Root check
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

echo "Adding repositories & keys..."

# Brave Browser
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | tee /etc/apt/sources.list.d/brave-browser-release.list

# VSCodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | tee /usr/share/keyrings/vscodium-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main" | tee /etc/apt/sources.list.d/vscodium.list

# ProtonVPN
add-apt-repository 'deb https://repo.protonvpn.com/debian unstable main' -y

echo "Running apt update once..."
apt-get update -y

echo "Installing packages..."
apt-get install -y \
  git bleachbit gufw p7zip-rar p7zip-full unace unrar zip unzip sharutils rar uudeview mpack arj cabextract file-roller \
  gnome-tweaks curl gnome-shell-extensions rsync \
  brave-browser steam-installer libvirt-daemon-system libvirt-clients virt-manager \
  remmina remmina-plugin-rdp remmina-plugin-vnc \
  codium telegram-desktop keepassxc protonvpn

# Install MegaSync
echo "Installing MegaSync..."
wget https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megasync-xUbuntu_22.04_amd64.deb -O /tmp/megasync.deb
apt install -y /tmp/megasync.deb
rm -f /tmp/megasync.deb

# Enable firewall
echo "Enabling UFW..."
ufw enable
ufw logging on

# Reveal hidden startup apps
echo "Revealing hidden startup applications..."
sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop

echo "Installation complete! Rebooting..."
reboot
