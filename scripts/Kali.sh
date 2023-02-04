#!/bin/bash
echo
"
________                                    __________.__
\______ \____________     ____   ____   ____\______   \__| ____  ____
 |    |  \_  __ \__  \   / ___\ /  _ \ /    \|       _/  |/ ___\/ __ \
 |    |   \  | \// __ \_/ /_/  >  <_> )   |  \    |   \  \  \__\  ___/
/_______  /__|  (____  /\___  / \____/|___|  /____|_  /__|\___  >___  >
        \/           \//_____/             \/       \/        \/    \/
"

sudo apt update
sudo apt upgrade

sudo apt install arduino

# Social Media
if test -e /files/hexchat/OFTC.pem; then
  sudo apt install hexchat
  hexchat
  sleep 5
  mkdir ~/.config/hexchat/certs
  cp /files/hexchat/OFTC.pem ~/.config/hexchat/certs/OFTC.pem
  sudo apt install telegram-desktop
fi

# Install Discord
echo "Installing discord"
sleep 3
wget -O discord.deb -P ~/Downloads "https://discord.com/api/download?platform=linux&format=deb"
sudo apt install ~/Downloads/discord.deb
rm ~/Downloads/discord.deb
discord
echo "Dont Forget to login to discord"
sleep 3

# Android Development
echo "Installing android tools"
sleep 3
sudo apt install fastboot
sudo apt install adb

# SDR
if test -e /files/gqrx/bookmarks.csv; then
  echo "Installing radio tools"
  sleep 3
  sudo apt install gqrx
  cp /files/gqrx/bookmarks.csv ~/.config/gqrx/bookmarks.csv
else
  echo "bookmarks.csv does not exist"
  sleep 3
fi

# Install profile picture
if test -e /files/.face; then
  echo "Installing profile picture"
  sleep 3
  DE=$XDG_CURRENT_DESKTOP
  if [ "$DE" == "KDE" ] || [ "$DE" == "XFCE" ]; then
    cp /files/.face ~/.face
  fi
else
  echo ".face does not exist"
  sleep 3
fi

# Import SSH Cert
echo "Importing SSH Certificate"
sleep 3
sudo apt install ssh-import-id
ssh-import-id GuildedThorn
sudo systemctl enable ssh --now

# Import GPG Key
if test -e /files/gpg/GuildedThorn.asc; then
  echo "Installing gpg key"
  sleep 3
  sudo apt -y install gnupg2 gnupg-agent
  gpg --import /files/gpg/GuildedThorn.asc
  git config --global user.signingkey 9B2C68FFF679499C
  git config --global commit.gpgsign true
else
  echo "GPG Key does not exist"
  sleep 3
fi

# Copy firmware for my devices into their proper location
if test -d /files/firmware; then
  echo "Installing custom firmware"
  sleep 3
  cp /files/firmware/BCM20702B0-19ff-0239.hcd /lib/firmware/brcm
fi

# Install Brave Browser
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list]
sudo apt update
sudo apt install brave-browser

# TODO: Pull and install either KDE theme or XFCE theme when its finished
# TODO: Pull and install ThornShell when its finished
reboot
