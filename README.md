# vagrant-node-git-zsh
### Creates a Linux-based Virtualbox running [Ubuntu 14.04.5 LTS](http://releases.ubuntu.com/trusty/ "Trusty Tahr"). Uses just a Vagrantfile and shell script to install Node, Git, Zsh (with Oh-My-Zsh), and mount a shared folder ( called "share") in the vagrant user's home folder.

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

* To re-provision the vagrant box, just run --      `vagrant provision` (This will run an apt-get update, apt-get upgrade, apt-get autoremove, and reinstall nodejs, git and zsh only if they were uninstalled since the initial provisioning.)

###If the build was succesful, your virtualbox has node 7 with build-essential, git and zsh using a theme from [Oh-My-Zsh](http://ohmyz.sh/ "Oh-My-Zsh Website").

Oh-My-Zsh has a number of helpful [shortcuts]("https://github.com/robbyrussell/oh-my-zsh/wiki/Cheatsheet") for shortening git commands and other frequent command line tasks.

If using Mac or Linux host, remove the crlf configuration for git.config in bootstrap.sh.




