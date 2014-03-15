Vim configuration
===

Introduction
---

This is my vim configuration. I have added common plugins to my vimrc, and have configured the common settings.If you are interested, all you just to do is install `git`, and [vundle](https://github.com/gmarik/Vundle.vim), then clone my repository to  your home directory. and rename `vimrc` file to `.vimrc`.Finally, put the `.vimrc` file to your home directory,namely `~/`.

More details, please refer to my vimrc file.

How to use?
---

1. Clone my repository to your home directory

	$git clone https://github.com/xautjzd/dotvim.git ~/.vim
	

2. Install [vundle](https://github.com/gmarik/Vundle.vim)

	$git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

3. Create soft link to `vimrc`

	$ln -s ~/.vim/vimrc ~/.vimrc

4. Install plugins via vundle

open vim, and run `:BundleInstall` to install the specified plugins in the `~/.vimrc` file.After completed,compile the YCM(YouCompleteMe) plugin.Before compiling, you should have `cmake` and `python` installed.

Install  development tools and CMake: 

    Ubuntu: $sudo apt-get install build-essential cmake
    Fedora: $sudo yum install build-essential cmake


Make sure you have Python installed:

    Ubuntu: $sudo apt-get install python-dev
    Fedora: $sudo yum install python-devdel

Compile `YouCompleteMe` plugin:

    $cd ~/.vim/bundle/YouCompleteMe
    $./install.sh ~/.vimrc

About more details,please refer to [YouCompleteMe](https://github.com/Valloric/YouCompleteMe). 

5. Install patched fonts

For the nice looking powerline symbols to appear, you will need to install a patched font. Instructions can be found in the official powerline [documentation][1]. Prepatched fonts can be found in the [powerline-fonts][2] repository

	
[1]: https://powerline.readthedocs.org/en/latest/fontpatching.html
[2]: https://github.com/Lokaltog/powerline-fonts

