# Update the box
apt-get -y update
#apt-get -y install linux-headers-$(uname -r) build-essential
#apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev
apt-get -y install curl unzip vim tmux

# Set up sudo
echo 'vagrant ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/vagrant

# LEAP still requires ssh-root login Jessie:
sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config 
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config 

# Either create a root password OR a user with sudo rights in the preseed
echo 'root:vagrant' | sudo chpasswd 

echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config 
sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config 

# Tweak sshd to prevent DNS resolution (speed up logins)
echo 'UseDNS no' >> /etc/ssh/sshd_config

# reload sshd
systemctl reload sshd

# Remove 5s grub timeout to speed up booting
cat <<EOF > /etc/default/grub
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.

GRUB_DEFAULT=0
GRUB_TIMEOUT=0
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
GRUB_CMDLINE_LINUX="debian-installer=en_US"
EOF

update-grub
