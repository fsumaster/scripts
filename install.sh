#!/bin/bash
#codeanywhere novnc via browser
#fsumaster
sudo apt install vnc4server x11vnc xfce4 xfce4-goodies nano firefox gedit -y
git clone https://github.com/novnc/noVNC
cd noVNC
chmod +x runner.sh
sh ./runner.sh
exit