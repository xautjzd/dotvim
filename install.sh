#!/usr/bin/env bash

# macos platform
if [ "$(uname)" == "Darwin" ]; then
    echo -e "\\n\\nRunning on macOS"

    if test ! "$( command -v brew )"; then
        echo "Installing homebrew"
        ruby -e "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install )"
    fi

    # install brew dependencies from Brewfile
    brew bundle

fi

# git setup
if ! [ -x "$(command -v git)"  ]; then
    echo 'Error: git is not installed.' >&2
    exit 1
fi

printf "Setting up Git...\\n\\n"
if [[ "$( uname )" == "Darwin" ]]; then
    git config --global credential.helper "osxkeychain"
else
    read -rn 1 -p "Save user and password to an unencrypted file to avoid writing? [y/N] " save
    if [[ $save =~ ^([Yy])$ ]]; then
        git config --global credential.helper "store"
    else
        git config --global credential.helper "cache --timeout 3600"
    fi
fi

# Change the default shell to zsh
zsh_path="$( command -v zsh )"
if ! grep "$zsh_path" /etc/shells; then
    echo "adding $zsh_path to /etc/shells"
    echo "$zsh_path" | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "$zsh_path" ]]; then
    chsh -s "$zsh_path"
    echo "default shell changed to $zsh_path"
fi

echo "Done. Reload your terminal."
