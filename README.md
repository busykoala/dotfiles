# Setup newly

Clone the repository to the home directory

```zsh
cd ~
git clone git@github.com:busykoala/dotfiles.git
```

Symlink the applications `.*rc` files to the dotfiles

```zsh
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gitignore ~/.gitignore
ln -s ~/dotfiles/python/.pythonrc ~/.pythonrc
ln -s ~/dotfiles/python/.pdbrc ~/.pdbrc
ln -s ~/dotfiles/.ideavimrc ~/.ideavimrc
```

Add computer specific config

```zsh
mkdir ~/dotfiles/user_specific
touch ~/dotfiles/user_specific/.gitconfig_expand
```
```zsh
[user]
    signingkey = XXXXXXXXXXXX
```


## Configure Vim

```zsh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Install Plugins with: `:PluginInstall`

If YouCompleteMe does not work yet:

```zsh
pacman -S cmake
cd ~.vim/bundle/YouCompleteMe
./install.py
```

