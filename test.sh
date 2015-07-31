#!/usr/bin/env bash

echo "Updating..."
sudo apt-get -y --force-yes update
echo "Updating complete."

echo "Cloning git command prompt..."
sudo apt-get -y --force-yes install git
git clone https://github.com/magicmonty/bash-git-prompt.git /home/vagrant/.bash-git-prompt
git config --global user.name "Evan"
git config --global user.email "embluhm@us.ibm.com"
git config --global credential.helper "cache --timeout=360000"
sudo echo "source /home/vagrant/.bash-git-prompt/gitprompt.sh" >> /root/.bashrc
sudo echo "source /home/vagrant/.bash-git-prompt/gitprompt.sh" >> /home/vagrant/.bashrc
echo "Git command prompt installed."

echo "Setting up bash prompt..."
cp /vagrant/.bashrc /home/vagrant/.bashrc
sudo cp /vagrant/.bashrc /root/.bashrc
echo "Finished setting up bash prompt"

echo "Installing cool vim rc"
git clone git://github.com/amix/vimrc.git /home/vagrant/.vim_runtime
sudo cp -r /home/vagrant/.vim_runtime /root/.vim_runtime
sudo sh /home/vagrant/.vim_runtime/install_awesome_vimrc.sh
sudo chown vagrant -R /home/vagrant/.vim_runtime
sudo sh /root/.vim_runtime/install_awesome_vimrc.sh
sudo apt-get install ctags
echo "Cool vimrc installed!"

echo "Installing python tools"
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo pip install plotly
sudo apt-get -y install python-matplotlib
sudo apt-get -y install python-numpy
sudo apt-get -y install python-dev
sudo apt-get -y install python-virtualenv
echo "Python tools installed!"

echo "Installing docker with AUFS driver"
sudo apt-get -y install linux-image-extra-$(uname -r)
sudo sh -c "wget -qO- https://get.docker.io/gpg | apt-key add -"
sudo sh -c "echo deb http://get.docker.io/ubuntu docker main\ > /etc/apt/sources.list.d/docker.list"
sudo apt-get -y update
sudo apt-get -y install lxc-docker
echo "Docker installed!"

echo "Installing command-line web browser..."
sudo apt-get -y install lynx-cur
echo "Lynx installed!"
