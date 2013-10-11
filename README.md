dotvim
======

##My vim configuration

If you want to use my vim configuration, just need to do:

###1. Install Vundle

  ```
  $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  ```
  
###2. Clone my configuration file

use git to clone my .vimrc file to your home directory(~)

  ```
  $ git clone https://github.com/xautjzd/dotvim.git ~/.vim
  $ ln -s ~/.vim/vimrc ~/.vimrc
	$ ln -s ~/.vim/gvimrc ~/.gvimrc
  ```

###3. Install vim plugins

use `vim ~/.vimrc` to open vimrc file,and type `:BundleInstall` to install vim plugins configured in vimrc.

After installed all plugins,you have to compile YouCompleteMe plugin.The method is as follows:

**Debian**

	```
	#install development tools and cmake
	$sudo apt-get install build-essential cmake
	#install python development tools
	$sudo apt-get install python-dev
	#compiling YCM with semantic support for C-family languages
	$cd ~/.vim/bundle/YouCompleteMe
	$./install.sh
	```

**Red Hat**

	```
	#install development tools and cmake
	$sudo yum groupinstall "Development Tools"
	$sudo yum install cmake
	#install python development tools
	$sudo apt-get install python-devel
	#compiling YCM with semantic support for C-family languages
	$cd ~/.vim/bundle/YouCompleteMe
	$./install.sh
	```

###4. Install patched fonts

	Open vim,you will find the statusbar is messy,so you have to install fonts to see awesome effect of air-line plugin
	Please refer:
	1. https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation
	2. https://github.com/Lokaltog/powerline-fonts

###5. ContactMe

  If you have some problems,just contact me.I will try my best to help you.
  - Twitter:xautjzd
  - Facebook:jiangzhengdong
  - Sina Weibo:xautjzd
  - Gmail:xautjzd@gmail.com

  
