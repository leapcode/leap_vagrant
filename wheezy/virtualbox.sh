if test -f .vbox_version ; then
  # The netboot installs the VirtualBox support (old) so we have to remove it
  /etc/init.d/virtualbox-ose-guest-utils stop
  rmmod vboxguest
  aptitude -y purge virtualbox-ose-guest-x11 virtualbox-ose-guest-dkms virtualbox-ose-guest-utils

  # Install the VirtualBox guest additions
  VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
  cd /tmp
  wget http://download.virtualbox.org/virtualbox/$VBOX_VERSION/VBoxGuestAdditions_$VBOX_VERSION.iso 
  VBOX_ISO=VBoxGuestAdditions_$VBOX_VERSION.iso
  mount -o loop $VBOX_ISO /mnt
  yes|sh /mnt/VBoxLinuxAdditions.run
  umount /mnt
fi
