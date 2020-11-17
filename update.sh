#!/bin/bash
LOGFILE="/home/"$1"/bin/update.log"
echo "Running update..." >>  $LOGFILE
date >> $LOGFILE
sudo apt update -y
sudo apt list --upgradable -a >> $LOGFILE
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y
echo "Completed update..." >>  $LOGFILE
date >>  $LOGFILE
echo " " >>  $LOGFILE

if [ -f /var/run/reboot-required ]; then
  echo "Reboot required" >> $LOGFILE
  date >> $LOGFILE
  sudo reboot
fi
echo "Logged to: "$LOGFILE

