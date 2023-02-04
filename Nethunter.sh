#!/sbin/sh
echo
"
________                                    __________.__
\______ \____________     ____   ____   ____\______   \__| ____  ____
 |    |  \_  __ \__  \   / ___\ /  _ \ /    \|       _/  |/ ___\/ __ \
 |    |   \  | \// __ \_/ /_/  >  <_> )   |  \    |   \  \  \__\  ___/
/_______  /__|  (____  /\___  / \____/|___|  /____|_  /__|\___  >___  >
        \/           \//_____/             \/       \/        \/    \/
"

apt update
apt upgrade

echo "Changing the password of the root user!"
sleep 3
passwd root

echo "Changing the password of the default user"
sleep 3
passwd kali

# Fix Kex - Thanks Re4son for the fix, Yex for the idea
wget -O /root/.vnc/xstartup https://gitlab.com/kalilinux/packages/kali-win-kex/-/raw/kali/master/usr/lib/win-kex/xstartup && chmod a+x /root/.vnc/xstartup

# Fix Internet - Thanks kimocoder
groupadd -g 3003 aid_inet && usermod -G nogroup -g aid_inet _apt
echo 'APT::Sandbox::User "root";' > /etc/apt/apt.conf.d/01-android-nosandbox

# Import SSH Cert
echo "Importing SSH Certificate"
sleep 3
apt install ssh-import-id
ssh-import-id GuildedThorn
systemctl enable ssh --now