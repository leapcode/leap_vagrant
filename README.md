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
You can either add our wheezy definitions to the templates or

    veewee <provider> define 'leap' 'git://leap.se/leap_vagrant.git

Building should be straightforward:

    veewee <provider> build 'leap'

Check out veewees documentation for all the options.

Debian Jessie Beta1
===================

Can be found in the debian-testing branch
    veewee <provider> define Debian-jessie.beta1-amd64-netboot Debian-jessie.beta1-amd64-netboot
    veewee <provider> build  Debian-jessie.beta1-amd64-netboot

Issues
======

* Libvirt images (KVM) are a lot larger as the Virtualbox ones (up to 1,5GB)
