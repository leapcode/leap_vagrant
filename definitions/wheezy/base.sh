date > /etc/box_build_time

# Before updating the box, get rid of pdiffs, they slow things down on faster links
echo 'Acquire::PDiffs "false";' >/etc/apt/apt.conf.d/90disable-pdiffs

# Update the box
apt-get -y update
apt-get -y install linux-headers-amd64 build-essential
apt-get -y install zlib1g-dev libssl-dev libreadline6-dev
apt-get -y install curl unzip
# Debians virtualbox guest utilities are too old
#apt-get -y install virtualbox-guest-utils
apt-get -y install puppet ruby-hiera-puppet rsync lsb-release
DEBIAN_FRONTEND=noninteractive apt-get -y install console-data
apt-get -y dist-upgrade
apt-get clean

# Set up sudo
cp /etc/sudoers /etc/sudoers.orig
sed -i -e 's/%sudo.*ALL=(ALL:ALL) ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers

# Tweak sshd to prevent DNS resolution (speed up logins)
echo 'UseDNS no' >> /etc/ssh/sshd_config

# Remove 5s grub timeout to speed up booting
echo <<EOF > /etc/default/grub
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.

GRUB_DEFAULT=0
GRUB_TIMEOUT=0
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
GRUB_CMDLINE_LINUX="debian-installer=en_US"
EOF

update-grub

