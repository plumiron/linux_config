#!/bin/bash
echo "正在安装依赖工具..."
if which apt-get >/dev/null; then
    sudo apt-get install -y vim
    sudo apt-get install -y screen
    sudo apt-get install -y python-setuptools python-dev
    sudo apt-get install -y ctags astyle
fi
sudo easy_install -ZU autopep8
sudo ln -s /usr/bin/ctags /usr/local/bin/ctags

echo "正在配置vim..."
mv -f ~/.vim ~/.vim_old
mv -f ~/.vimrc ~/.vimrc_old
sudo git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo cp vimrc ~/.vimrc
sudo vim +PluginInstall +qall

echo "正在配置screen..."
sudo cp screenrc ~/.screenrc
