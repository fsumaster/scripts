#!/bin/bash
#codeanywhere novnc via browser
#fsumaster
touch dependencies.sh
echo 'sudo -i apt install vnc4server x11vnc xfce4 xfce4-goodies nano firefox gedit -y' >> dependencies.sh
chmod +x dependencies.sh
touch runner.sh
echo '#!/bin/bash' >> runner.sh
echo 'cd noVNC' >> runner.sh
echo 'vncserver -geometry 1920x1080' >> runner.sh
echo './utils/novnc_proxy --vnc localhost:5901 --listen localhost:6081' >> runner.sh
echo 'Be respectful' >> runner.sh
chmod +x runner.sh
git clone https://github.com/novnc/noVNC
wget https://raw.githubusercontent.com/fsumaster/scripts/main/runner.sh
sleep 1
sudo ./dependencies.sh
./runner.sh
exit
