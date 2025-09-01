#!/bin/bash
echo "#############################################################"
echo "#          FSUMASTER - [Ubuntu]-setup script - v2.2        #"
echo "#             tested on Ubuntu 22.04 LTS                    #"
echo "#############################################################"
echo "\"free your mind and your ass will follow\""

# Trap Ctrl+C to exit cleanly
trap 'echo -e "\nScript interrupted by user. Exiting."; exit 1' SIGINT

# Ensure sudo is available
if ! command -v sudo >/dev/null 2>&1; then
    echo "Error: sudo not installed. Install sudo first."
    exit 1
fi

# Update system
sudo apt update -y
sudo apt upgrade -y

# Install core packages (no Steam, no Snap)
sudo apt install -y \
    git bleachbit gufw p7zip-rar p7zip-full unace unrar zip unzip sharutils rar \
    uudeview mpack arj cabextract file-roller gnome-tweaks curl gnome-shell-extensions \
    rsync remmina keepassxc virt-manager

# Brave browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg \
    https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" \
    | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update -y
sudo apt install -y brave-browser

# ProtonVPN (via apt install, repo auto-handled)
sudo add-apt-repository -y 'deb https://repo.protonvpn.com/debian stable main'
sudo apt update -y
sudo apt install -y protonvpn

# MegaSync
wget https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megasync-xUbuntu_22.04_amd64.deb -O /tmp/megasync.deb
sudo apt install -y /tmp/megasync.deb
rm -f /tmp/megasync.deb

# Latest VSCodium (GitHub release)
VSCODIUM_URL=$(curl -s https://api.github.com/repos/VSCodium/vscodium/releases/latest \
  | grep browser_download_url \
  | grep "amd64.deb" \
  | cut -d '"' -f 4)
wget -O /tmp/vscodium-latest.deb "$VSCODIUM_URL"
sudo apt install -y /tmp/vscodium-latest.deb
rm -f /tmp/vscodium-latest.deb

# Latest Telegram Desktop
wget -O /tmp/telegram.tar.xz "https://telegram.org/dl/desktop/linux"
sudo mkdir -p /opt/telegram
sudo tar -xJf /tmp/telegram.tar.xz -C /opt/telegram
sudo ln -sf /opt/telegram/Telegram/Telegram /usr/local/bin/telegram-desktop
cat <<EOF | sudo tee /usr/share/applications/telegram-desktop.desktop >/dev/null
[Desktop Entry]
Name=Telegram Desktop
Comment=Official Telegram Desktop client
Exec=/usr/local/bin/telegram-desktop
Icon=/opt/telegram/Telegram/telegram.svg
Terminal=false
Type=Application
Categories=Network;InstantMessaging;
EOF
rm -f /tmp/telegram.tar.xz

# Latest Steam
wget -O /tmp/steam.deb "https://cdn.fastly.steamstatic.com/client/installer/steam.deb"
sudo apt install -y /tmp/steam.deb
rm -f /tmp/steam.deb

# Enable firewall
sudo ufw enable

# Reveal hidden startup applications
sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop

# Reboot prompt
echo "#############################################################"
echo " All tasks completed. Reboot recommended to apply changes."
while true; do
    read -r -p "Reboot now? (y/n): " REBOOT
    case "$REBOOT" in
        [Yy]*) sudo reboot; break ;;
        [Nn]*) echo "Reboot skipped. You can reboot later manually."; break ;;
        *) echo "Please answer y (yes) or n (no)." ;;
    esac
done
