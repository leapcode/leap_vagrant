About
=====

This repository contains Debian vagrant basebox definitions to get started with
[LEAP](https://leap.se).

That means a base Wheezy installation, with puppet, ruby, virtualbox guest
additions… Still kept as minimal as possible.

The installer used is the latest version of the installer and after the system
has been installed, the packages have been updated to the latest version at the
time the system was built.


Download pre-built baseboxes
============================

Since GitHub retired its downloads area, you will now have to find baseboxes
built from these definitions at [LEAP](http://download.leap.se/).
You'll find Debian Wheezy baseboxes for Virtualbox and KVM.


Build basebox yourself
======================

If you want to build a box yourself, you first need to install
[veewee](https://github.com/jedi4ever/veewee) and it's
dependencies.

Building should be straightforward using our pre-defined leap-wheezy
definitions:

Debian wheezy amd64
-------------------

    veewee <provider> build  wheezy
    veewee <provider> export wheezy

To use it in Vagrant, use

    vagrant box add LEAP/wheezy /home/varac/dev/projects/leap/git/leap_vagrant/wheezy.box


Debian Jessie amd64
-------------------

    veewee <provider> build  jessie
    veewee <provider> export jessie

To use it in Vagrant, use

    vagrant box add LEAP/jessie /home/varac/dev/projects/leap/git/leap_vagrant/jessie.box



Check out veewees documentation for all the options.

Issues
======

* Libvirt images (KVM) are a lot larger as the Virtualbox ones (up to 1,5GB)
  see https://github.com/jedi4ever/veewee/issues/
* jessie: you need to manually choose the boot device for grub
