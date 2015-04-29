# Prepare puppetlabs repo
wget http://apt.puppetlabs.com/puppetlabs-release-jessie.deb
dpkg -i puppetlabs-release-jessie.deb
apt-get update

# Install puppet/facter
apt-get install -y puppet facter
