#!/bin/bash

# install command-line tools for Xcode
xcode-select --install > /dev/null 2>&1
# allow to open in terminal from unknown
# sudo spctl --master-disable

if hash brew 2>/dev/null; then
    echo "--> Brew is installed. Not doing anything."
else
    echo "--> Brew is getting installed."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "--> Dependencies from Brewfile are getting installed."
brew bundle install

VIM_REPO_FOLDER=~/vim_config
VIM_REPO_URL=git@github.com:busykoala/vim_config.git
if [ ! -d "$VIM_REPO_FOLDER" ] ; then
    echo "--> The vim repo gets cloned."
    git clone $VIM_REPO_URL $VIM_REPO_FOLDER
else
    echo "--> The vim repos exists, it is getting pulled."
    git -C $VIM_REPO_FOLDER pull
fi

echo "--> Symlink and (re-)setup environment."
# Symlink .vimrc
ln -sf ~/vim_config/.vimrc ~/.vimrc
ln -sf ~/vim_config/.editorconfig ~/.editorconfig

# Get Plug (vim plugin manager)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Create .buildout (and sub-) directories
mkdir -p ~/.buildout/download-cache
mkdir -p ~/.buildout/eggs
mkdir -p ~/.buildout/extends-cache
mkdir -p ~/.buildout/var

# Symlink dotfiles
ln -sf ~/dotfiles/.default_eslintrc ~/.eslintrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.global_gitignore ~/.global_gitignore
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc
ln -sf ~/dotfiles/.isort.cfg ~/.isort.cfg
ln -sf ~/dotfiles/python/.pdbrc ~/.pdbrc
ln -sf ~/dotfiles/python/.pythonrc ~/.pythonrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.buildout_default.cfg ~/.buildout/.default.cfg

echo "--> Update & upgrade brew now."
brew update
brew upgrade
brew cask upgrade
mas upgrade
