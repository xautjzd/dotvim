Vim configuration
===

Introduction
---

This is my vim configuration. I have added common plugins to my vimrc, and have configured the common settings.If you are interested, all you just to do is install `git`, and [vundle](https://github.com/gmarik/Vundle.vim), then clone my repository to  your home directory. and rename `vimrc` file to `.vimrc`.Finally, put the `.vimrc` file to your home directory,namely `~/`.

More details, please refer to my vimrc file.

How to use?
---

1. Clone my repository to your home directory.

```
	$git clone https://github.com/xautjzd/dotvim.git ~/.vim
```

2. Install [vundle](https://github.com/gmarik/Vundle.vim).

```
	$git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

3. Create soft link to `vimrc`.

```
	$ln -s ~/.vim/vimrc ~/.vimrc
```

4. Install plugins via vundle.

open vim, and run `:BundleInstall` to install the specified plugins in the `~/.vimrc` file.After completed,compile the YCM(YouCompleteMe) plugin.

```
	$cd ~/.vim/bundle/YouCompleteMe
	$./install.sh ~/.vimrc
```

	

