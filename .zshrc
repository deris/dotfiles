# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8

## Default shell configuration
#
# set prompt
#
autoload colors
colors
case ${UID} in
0)
  PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
  PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
*)
  PROMPT="%{${fg[red]}%}%/%%%{${reset_color}%} "
  PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
  SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
esac

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd
setopt pushd_ignore_dups

# command correct edition before each completion attempt
#
setopt nocorrect

#
setopt nonomatch

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep

# ignore Ctrl+D(EOF)
#
setopt ignoreeof

# enable interactive comment
#
setopt interactivecomments

# no beep
#
setopt no_beep

# extended_glob
#
setopt extended_glob

unsetopt promptcr

# umask
umask 002

## Keybind configuration
#

# disable XON/XOFF flow control to allow ^S for history search
stty -ixon

# vi like keybind
bindkey -v               # vi key bindings

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

bindkey "^@" set-mark-command
bindkey "^A" beginning-of-line
bindkey "^B" backward-char
bindkey "^D" delete-char-or-list
bindkey "^E" end-of-line
bindkey "^F" forward-char
bindkey "^G" send-break
bindkey "^H" backward-delete-char
bindkey "^I" expand-or-complete
bindkey "^J" accept-line
bindkey "^K" kill-line
bindkey "^L" clear-screen
bindkey "^M" accept-line
bindkey "^O" accept-line-and-down-history
bindkey "^Q" push-line
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
bindkey "^T" transpose-chars
bindkey "^U" kill-whole-line
bindkey "^V" quoted-insert
bindkey "^W" backward-kill-word
bindkey "^Y" yank

bindkey "^[f" emacs-forward-word
bindkey "^[b" emacs-backward-word
bindkey "^[^H" backward-kill-word
bindkey "^[D" kill-word
bindkey "^[d" kill-word
export WORDCHARS=""

bindkey -a 'q' push-line

bindkey '^I' complete-word # complete on tab, leave expansion to _expand

## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE

# ignore duplication command history list
#
setopt hist_ignore_dups
setopt hist_ignore_all_dups  # ignore all duplicates (not just consecutive)
setopt hist_reduce_blanks    # remove extra blanks from history entries
setopt hist_verify           # show expanded history before executing

# share command history data
#
setopt share_history

## Completion configuration
#
autoload -U compinit
compinit -C

## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases # aliased ls needs if file/dir completions work

alias where="command -v"

case ${OSTYPE} in
  darwin*)
    # setting for mac osx
    alias chrome="open -a Google\ Chrome"
    alias firefox="open -a Firefox"
    alias safari="open -a Safari"
    alias prev="open -a Preview"
    alias gvim='mvim --remote-tab-silent'
    alias memo='vim ~/Documents/memo/memo.txt'

    BREW_PREFIX=`brew --prefix`
    typeset -U fpath
    if [ -d "~/.zsh/functions" ]; then
      fpath=(~/.zsh/functions $fpath)
    fi
    if [ -d "/usr/local/share/zsh-completions" ]; then
      fpath=(/usr/local/share/zsh-completions $fpath)
    fi
    . $BREW_PREFIX/etc/profile.d/z.sh

    ;;
  linux*)
    # setting for linux
    alias ls="ls --color"
    ;;
esac

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls -FG'
alias ll='ls -aFGhl'
alias la='ls -aFG'
alias lt='ls -aFGhlt | head -10'
alias less='less -M'
alias grep='grep -E --color'
alias g='git'
alias updatedb='/usr/libexec/locate.updatedb'

alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

alias cpaninstalled="cat \`perldoc -l perllocal\` | perl -nle '/C<Module> L<([^\\|]*?)\\|.*?>/ and print \$1' | sort -u"
alias iperl='perl -de 1'

alias h='history -16'
alias l='less'

export EDITOR=vim
export VIM_HOME=~/.vim/
typeset -U PATH
export PATH=/usr/local/bin:$PATH
export PATH=~/local/bin:$PATH
export PATH=~/.cabal/bin:$PATH
export PATH=~/.rbenv/bin:$PATH
export PATH=~/.plenv/bin:$PATH
eval "$(rbenv init -)"
eval "$(plenv init -)"
case ${OSTYPE} in
  darwin*)
    export PATH=$PATH:`find /Applications/Xcode.app -name swift|grep bin|xargs -I{} dirname {}`
    :;
esac

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin


zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

## terminal configuration
#
unset LSCOLORS
case "${TERM}" in
xterm)
  export TERM=xterm-color
  ;;
kterm)
  export TERM=kterm-color
  # set BackSpace control character
  stty erase
  ;;
cons25)
  unset LANG
  export LSCOLORS=GxFxCxdxBxegedabagacad
  export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
  ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm*)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  }
  export LSCOLORS=Gxfxcxdxbxegedabagacad
  export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
esac

# Oh My Zsh Settings
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

[ -f "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"

# run terminal multiplexer when zsh start.
is_screen_running() {
  # tscreen also uses this variable.
  [ ! -z "$WINDOW" ]
}
is_tmux_running() {
  [ ! -z "$TMUX" ]
}
is_screen_or_tmux_running() {
  is_screen_running || is_tmux_running
}
shell_has_started_interactively() {
  [ ! -z "$PS1" ]
}
resolve_alias() {
  cmd="$1"
  while \
    whence "$cmd" >/dev/null 2>/dev/null \
    && [ "$(whence "$cmd")" != "$cmd" ]
  do
  cmd=$(whence "$cmd")
    done
  echo "$cmd"
}


if ! is_screen_or_tmux_running && shell_has_started_interactively; then
  for cmd in tmux tscreen screen; do
    if whence $cmd >/dev/null 2>/dev/null; then
      $(resolve_alias "$cmd")
      break
    fi
  done
fi

## load user .zshrc configuration file
#
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
