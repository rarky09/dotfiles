#! /bin/zsh
export ZPLUG_HOME=$HOME/.zplug.d
git clone https://github.com/zplug/zplug $ZPLUG_HOME
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zplug ~/.zplug
ln -s ~/dotfiles/.zshmac ~/.zshmac