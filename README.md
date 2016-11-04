# vagrant-node-git-zsh
### Creates a Linux-based Virtualbox running [Ubuntu 14.04.5 LTS](http://releases.ubuntu.com/trusty/ "Trusty Tahr"). Uses just a Vagrantfile and shell script to install Node, Git, Zsh (with Oh-My-Zsh), Heroku toolbelt, and mount a shared folder ( called "share") in the vagrant user's home folder.

Pre-requisites:

#### [Vagrant](https://www.vagrantup.com/ "Vagrant website")

#### [Virtualbox](https://www.virtualbox.org/wiki/Downloads "Oracle's Virtualbox Website")

##Basic use:

From a terminal prompt:

* `git clone git@github.com:waltdakind/vagrant-node-git-zsh.git && cd vagrant-node-git-zsh`
 
* `vagrant up`

* `vagrant ssh`

* Ctrl-D to logout followed by `vagrant suspend` (save VM state)
or `vagrant halt` ( power off VM )

* To re-provision the vagrant box, just run --      `vagrant provision` (This will run an apt-get update, apt-get upgrade, apt-get autoremove, and reinstall nodejs, git, heroku toolbelt and zsh only if they were uninstalled since the initial provisioning.)

###If the build was succesful, your virtualbox has node 7 with build-essential, git and zsh using a theme from [Oh-My-Zsh](http://ohmyz.sh/ "Oh-My-Zsh Website").

Oh-My-Zsh has a number of helpful [shortcuts]("https://github.com/robbyrussell/oh-my-zsh/wiki/Cheatsheet") for shortening git commands and other frequent command line tasks.

If using Mac or Linux host, remove the crlf configuration for git.config in bootstrap.sh.

Trusty Tahr is the version of Ubuntu used on Heroku's Cedar-14 stack, so this is a good development environment for testing Node applications to be deployed to Heroku. Heroku can be removed with:


   `sudo apt-get remove heroku-toolbelt`
 

   `sudo rm /etc/apt/sources.list.d/heroku.list`

and deleting the following line from the Vagrantfile:


  `config.vm.provision :shell, inline: "wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh"`



