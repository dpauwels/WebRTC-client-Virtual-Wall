#!/bin/bash
sudo apt-get update
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb; sudo dpkg -i google-chrome*.deb; sudo apt-get -f install -y && sudo dpkg -i google-chrome*.deb
sudo apt-get install -y xvfb libnss3-tools

certutil -d sql:$HOME/.pki/nssdb -A -t "C,," -n "webrtc" -i cert.crt

# sudo iwconfig wlan0 mode managed
# sudo iwconfig wlan0 essid demo1
# [[ $# -eq 1 ]] || { echo "geef IP adres op: 192.168.X.X" 1>&2 ; exit 1; }
# sudo ifconfig wlan0 ${1}/24 up

# sudo echo "192.168.1.1	server"

# enable webcam (location: /dev/video0)
# sudo usermod -a -G video dpauwels
# log in again
