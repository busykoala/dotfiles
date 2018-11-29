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
ln -s ~/dotfiles/python/.pythonrc ~/.pythonrc
ln -s ~/dotfiles/python/.pdbrc ~/.pdbrc
```
