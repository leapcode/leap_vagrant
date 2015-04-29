date > /etc/box_build_time

# install puppet and other packages needed for leap_cli
apt-get -y install puppet rsync lsb-release
# Install additional packages to vagrant wheezy basebox to make beaker happy #6898
apt-get -y install ntpdate git rdoc

DEBIAN_FRONTEND=noninteractive apt-get -y install console-data


