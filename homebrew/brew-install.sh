################################################################################
# install homebrew
################################################################################
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# essential
brew install wget
brew install curl
brew install zsh
brew install zsh-completions
brew install tmux
brew install reattach-to-user-namespace
brew install openssl
brew install z
brew install ag
brew install lv
brew install nkf
brew install tree
brew install readline
brew install rename
brew install rmtrash
brew install xz
brew install binutils
brew install coreutils
brew install findutils
brew install proctools
brew install htop
brew install mobile-shell
brew install terminal-notifier

# dev
brew install git
brew install hub
brew install tig
brew install gibo
brew install python
brew install mercurial
brew install rbenv
brew install ruby-build
brew install rbenv-default-gems
brew install imagemagick
brew install plenv
brew install perl-build
brew install lua
brew install luajit
brew install ctags
brew install cscope
brew install cmigemo
brew install source-highlight
brew install jq
brew install go
# go get -u github.com/typester/gh-open
brew tap motemen/ghq
brew install ghq
brew install direnv
brew install peco
brew install sqlite
brew install mysql
brew install redis
brew install socat
brew install arp-scan
brew install scala
brew install leiningen
brew install ghc cabal-install
brew install rlwrap
brew tap homebrew/binary
brew install packer
# TODO: add vim install option
brew install vim --with-lua --with-cscope

brew cleanup

################################################################################
# install homebrew-cask
################################################################################
brew install caskroom/cask/brew-cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# dev
brew cask install java
# TODO: add iterm2 settings
brew cask install iterm2
# TODO: add macvim install option
brew cask install macvim
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager
brew cask install boot2docker
brew cask install filezilla
brew cask install heroku-toolbelt
brew cask install github
brew cask install xquartz
brew cask install wireshark

# utils
# TODO: add karabiner settings
brew cask install karabiner
# TODO: add bettertouchtool settings
brew cask install bettertouchtool
brew cask install hyperswitch
brew cask install slate

# browsers
brew cask install firefox
brew cask install google-chrome

# others
brew cask install alfred
brew cask install google-japanese-ime
brew cask install appcleaner
brew cask install dropbox
brew cask install skype
brew cask install vlc
brew cask install xtrafinder
brew cask install flux
brew cask install selfcontrol
brew cask install adobe-reader
brew cask install coteditor
brew cask install grandperspective
brew cask install keycastr
brew cask install lingrradar
brew cask install utorrent
brew cask install google-hangouts
brew cask install minecraft
brew cask install steam

# quick look plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webpquicklook suspicious-package && qlmanage -r

brew cask alfred link

# install from App Store
# # only alfred must be install from cask because of enabling to find smbolic link
# brew cask install xcode
# brew cask install kobito
# brew cask install dash
# brew cask install slack
# brew cask install cyberduck
# brew cask install caffeine
# brew cask install the-unarchiver
# brew cask install easyfind
# brew cask install gyazo
# brew cask install forklift
# brew cask install night-owl
# brew cask install evernote
# brew cask install remote-desktop-connection
# brew cask install kindle
# brew cask install wunderlist

brew cask cleanup
