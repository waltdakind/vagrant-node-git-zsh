# vagrant-node-git-zsh
### Basic Ubuntu box -- Vagrantfile and shell script to install Node, Git, Zsh (with Oh-My-Zsh) and a shared folder

Pre-requisites:

####Vagrant

####Virtualbox

##Basic use:

From a terminal prompt:

* `git clone git@github.com:waltdakind/vagrant-node-git-zsh.git && cd 
`
 
* `vagrant up`

* `vagrant ssh`

* Ctrl-D to logout followed by `vagrant suspend` (save VM state)
or `vagrant halt` ( power off VM )

* To re-provision the vagrant box, just run --      `vagrant provision`

###If the build was succesful, your virtualbox has node 7 with build-essential, git and zsh using a theme from Oh-My-Zsh.

If using Mac or Windows host, remove the crlf configuration for git.config in bootstrap.sh.




