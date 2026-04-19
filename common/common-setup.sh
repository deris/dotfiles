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

################################################################################
# install Custom Vim
################################################################################
git clone https://github.com/deris/vim ~/work/vim.deris
cd ~/work/vim.deris

case "$OSTYPE" in
  linux*)
    ./configure \
      --enable-python3interp \
      --with-python3-command="pyenv which python3" \
      --with-python3-config-dir="$(python3-config --configdir)" \
      --enable-perlinterp \
      --enable-rubyinterp \
      --with-ruby-command="$(rbenv which ruby)" \
      --with-features=huge \
      --prefix=/usr/local \
      --enable-fail-if-missing \
      --with-x \
      --enable-fontset \
      --enable-xim \
      --enable-gui=gtk3
    make
    make install
    ;;
  darwin*)
    ./configure \
      --enable-python3interp \
      --with-python3-command="$(pyenv which python3)" \
      --with-python3-config-dir="$(python3-config --configdir)" \
      --enable-perlinterp \
      --enable-rubyinterp \
      --with-ruby-command="$(rbenv which ruby)" \
      --with-features=huge \
      --prefix=$HOME/.local \
      --enable-fail-if-missing \
      --enable-gui=no
    make
    make install
    ;;
esac
