################################################################################
# chsh zsh
################################################################################
chsh -s `which zsh`

################################################################################
# set up dotfiles
################################################################################
git clone https://github.com/deris/dotfiles ~/dotfiles
ln -s ~/dotfiles/.vimrc .vimrc
ln -s ~/dotfiles/.zshrc .zshrc
ln -s ~/dotfiles/.gitconfig .gitconfig
ln -s ~/dotfiles/.tmux.conf .tmux.conf

################################################################################
# install zsh plugins
################################################################################

# install oh-my-zsh
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh

################################################################################
# install Vim plugins
################################################################################
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
sh ~/.vim/bundle/neobundle.vim/bin/neoinstall
