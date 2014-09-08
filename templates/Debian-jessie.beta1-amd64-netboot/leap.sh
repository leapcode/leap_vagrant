# prerequisites for instlling the leap_platform
# see https://leap.se/en/platform

date > /etc/box_build_time

# Before updating the box, get rid of pdiffs, they slow things down on faster links
#echo 'Acquire::PDiffs "false";' >/etc/apt/apt.conf.d/90disable-pdiffs

apt-get -y dist-upgrade
apt-get clean

