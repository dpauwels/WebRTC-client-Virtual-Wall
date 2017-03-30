#!/bin/bash
sudo apt-get update
sudo dpkg -i google-chrome*.deb; sudo apt-get -f install -y && sudo dpkg -i google-chrome*.deb
sudo apt-get install -y xvfb libnss3-tools

xvfb-run google-chrome &> /dev/null &
sudo kill $(ps aux | grep xvfb | awk '{print $2}') &> /dev/null
sudo kill $(ps aux | grep chrome | awk '{print $2}') &> /dev/null

certutil -d sql:$HOME/.pki/nssdb -A -t "C,," -n "webrtc" -i cert.crt

