# vagrant-node-git-zsh
Basic Ubuntu box -- Vagrantfile and shell script to install Node, Git, Zsh (with Oh-My-Zsh) and a shared folder

Pre-requisites:
Vagrant
Virtualbox

Basic use:

From a terminal prompt:

git clone git@github.com:waltdakind/vagrant-node-git-zsh.git
 
vagrant up

vagrant ssh




# If it was succesful, this installs node 7 with build-essential, git and zsh using a theme from Oh-My-Zsh.

If using Mac or Windows host, remove the crlf configuration for git.config in bootstrap.sh.




