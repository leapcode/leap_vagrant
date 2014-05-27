This repository contains Debian vagrant definitions to get started with
[LEAP](https://leap.se).

That means a base Wheezy installation, with puppet, ruby, virtualbox guest
additions… Still kept as minimal as possible. 

The installer used is the latest version of the installer and after the system
has been installed, the packages have been updated to the latest version at the
time the system was built. 

Since GitHub retired its downloads area, you will now have to find baseboxes
built from these definitions at [LEAP](http://download.leap.se/).

If you want to build a box yourself, you first need to install veewee and it's
dependencies. You can either add our wheezy definitions to the templates or
veewee <provider> define 'leap' 'git://leap.se/leap_vagrant.git
Building should be straightforward: veewee <provider> build 'leap'
Check out veewees documentation for all the options.
