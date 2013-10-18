#!/usr/bin

#1. Install vundle
cd ~

git --version
GIT_IS_AVAILABLE=$?  # Get the last cmd's exit status, 0 if cmd exit successfully

if [ $GIT_IS_AVAILABLE -ne 0 ]
then
	echo "-------------------------------------------------------------"
	echo Git has not been installed yet!Installing Git...
	sudo apt-get -y install git
	echo installing success
fi

# Install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Clone my configuration to your home directory
git clone https://github.com/xautjzd/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

# Install vim plugins
vim +BundleInstall +qall

# Install development environment for YouCompleteMe plugin
sudo apt-get -y install build-essential cmake python-dev
sh ~/.vim/bundle/YouCompleteMe

# Install patched fonts
git clone https://github.com/Lokaltog/powerline-fonts.git ~/.fonts
fc-cache -vf ~/.fonts







