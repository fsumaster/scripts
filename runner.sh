#!/bin/bash
cd noVNC
vncserver -geometry 1920x1080
./utils/novnc_proxy --vnc localhost:5901 --listen localhost:6081
