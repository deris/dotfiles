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
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install zsh-completions
git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install fast-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

# install fzf-tab
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

################################################################################
# install zsh plugins
################################################################################

# install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

################################################################################
# install Vim plugins
################################################################################
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
