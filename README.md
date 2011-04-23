Environs
========

A list of Puppet[1] configs for use with Vagrant[2] for VirtualBox vms for use in general local web-dev'ing.
Based off an initial Ubuntu Maverick 10.10 (64-bit image).

[1] [http://www.puppetlabs.com](http://www.puppetlabs.com)

[2] [http://www.vagrantup.com](http://www.vagrantup.com)


VMs
---

1. dev - A basic web dev vm for nodejs and Python development. Installs Git, some python dev tools (ipython, pip), NodeJs, apache2 and nginx.
         Also sets up a shared folder (see Vagrantfile - you'll need to remove/amend)


Usage:
======


Install Vagrant and Puppet

    $ gem install vagrant

See [Puppet install page](http://docs.puppetlabs.com/guides/installation.html) for instructions

Initialise base box
-------------------

Add a base box (instructions from [VagrantBox.es](http://www.vagrantbox.es])

    $ vagrant box add ubuntu-maverick-64 http://mathie-vagrant-boxes.s3.amazonaws.com/maverick64.box
    // Let's test
    $ mkdir environsTest && cd environsTest
    $ vagrant init ubuntu-maverick-64
    $ vagrant up
    // it worked
    $ vagrant halt.
    
Clone
-----

    $ git clone https://github.com/lawrencec/environs
    Edit the config.vm.share_folder property in the webdev/Vagrantfile to point to
    the folder you want to share. 
    $ cd environs
    $ vagrant up
    $ vagrant ssh



Use as a base box
-----------------

Packaging it up as a base box allows distribution as well as usage as a base box for other subsequent vms.

    $ cd webdev
    $ vagrant package --include Vagrantfile --base webdev-core 
    $ vagrant box add webdev-core package.box
    $ vagrant box list
    
Now you can use webdev.box as a base box 

    $ mkdir test_environment
    $ cd test_environment
    $ vagrant init webdev-core
    $ vagrant up
    $ vagrant ssh
    
TODO
====

* Various things but perhaps use some of the config at [David Schmitt's repo](http://projects.puppetlabs.com/projects/puppet/wiki/Complete_Configuration) and the Puppet forge
* A CI environment


