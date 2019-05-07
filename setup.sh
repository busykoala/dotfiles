#!/bin/bash

VIM_REPO_FOLDER=~/vim_config
VIM_REPO_URL=git@github.com:busykoala/vim_config.git
if [ ! -d "$VIM_REPO_FOLDER" ] ; then
	echo "The vim repo gets cloned"
	git clone $VIM_REPO_URL $VIM_REPO_FOLDER
else
	echo "The vim repos exists, it is getting pulled"
	git -C $VIM_REPO_FOLDER pull
fi

# Symlink .vimrc
ln -sf ~/vim_config/.vimrc ~/.vimrc
ln -sf ~/vim_config/.editorconfig ~/.editorconfig

YCM_REPO_FOLDER=~/.vim/bundle/Vundle.vim
YCM_REPO_URL=https://github.com/gmarik/Vundle.vim.git
if [ ! -d "$YCM_REPO_FOLDER" ] ; then
	echo "The YCM repo gets cloned"
	git clone $YCM_REPO_URL $YCM_REPO_FOLDER
else
	echo "The YCM repos exists, it is getting pulled"
	git -C $YCM_REPO_FOLDER pull
fi

# YCM Configuration information
echo ""
echo "#######################################################"
echo "Please see https://github.com/Valloric/YouCompleteMe"
echo "and configure accordingly."
echo ""
echo "Also install astyle and for R the package lintr"
echo ""
echo "See https://github.com/busykoala/vim_config for more info"
echo "######################################################"

# Symlink dotfiles
ln -sf ~/dotfiles/.default_eslintrc ~/.eslintrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitignore ~/.gitignore
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc
ln -sf ~/dotfiles/.isort.cfg ~/.isort.cfg
ln -sf ~/dotfiles/python/.pdbrc ~/.pdbrc
ln -sf ~/dotfiles/python/.pythonrc ~/.pythonrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
