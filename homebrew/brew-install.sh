################################################################################
# install homebrew
################################################################################
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# essential
brew install wget
brew install curl
brew install zsh
brew install zsh-completions
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install tmux
brew install reattach-to-user-namespace
brew install openssl
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
brew install llvm
brew install fzf
brew install fzf-tab
brew install zoxide

# dev
brew install git
brew install hub
brew install tig
brew install gibo
brew install python
brew install pyenv
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
# brew tap homebrew/binary
brew install packer
# TODO: add vim install option
brew install vim --with-lua --with-cscope
brew install rust
brew install ripgrep
brew install eza
brew install starship
brew install jj
brew install fnm
brew install uv

brew cleanup

################################################################################
# install homebrew-cask
################################################################################

# dev
# brew install --cask java
# TODO: add macvim install option
brew install --cask macvim
brew install --cask virtualbox
brew install --cask vagrant
# brew install --cask vagrant-manager
# brew install --cask boot2docker
# brew install --cask filezilla
# brew install --cask heroku-toolbelt
brew install --cask github
brew install --cask xquartz
brew install --cask wireshark
brew install --cask visual-studio-code
brew install --cask slack
brew install --cask claude
brew install --cask flutter
brew install --cask ghostty
brew install --cask raycast

# utils
# TODO: add karabiner settings
brew install --cask karabiner-elements
# TODO: add bettertouchtool settings
brew install --cask bettertouchtool
brew install --cask scroll-reverser
brew install --cask clibor

# browsers
brew install --cask firefox
brew install --cask google-chrome

# others
brew install --cask appcleaner
brew install --cask dropbox
brew install --cask vlc
brew install --cask xtrafinder
brew install --cask flux
brew install --cask selfcontrol
brew install --cask adobe-reader
brew install --cask coteditor
brew install --cask grandperspective
brew install --cask keycastr
brew install --cask lingrradar
brew install --cask utorrent
brew install --cask google-hangouts
brew install --cask minecraft
brew install --cask steam

# quick look plugins (https://github.com/sindresorhus/quick-look-plugins)
# brew install --cask qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webpquicklook suspicious-package && qlmanage -r

# install from App Store
# brew install --cask xcode
# brew install --cask kobito
# brew install --cask dash
# brew install --cask slack
# brew install --cask cyberduck
# brew install --cask caffeine
# brew install --cask the-unarchiver
# brew install --cask easyfind
# brew install --cask gyazo
# brew install --cask forklift
# brew install --cask night-owl
# brew install --cask evernote
# brew install --cask remote-desktop-connection
# brew install --cask kindle

brew cleanup
