#!/sbin/sh

# Credit: https://www.kali.org/docs/nethunter/nethunter-rootless/#installation
termux-setup-storage
pkg install wget
wget -O install-nethunter-termux https://offs.ec/2MceZWr
chmod +x install-nethunter-termux
./install-nethunter-termux
