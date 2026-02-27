# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8

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

bindkey -e               # emacs key bindings

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

export WORDCHARS=""

bindkey '^I' complete-word # complete on tab, leave expansion to _expand

case ${OSTYPE} in
  darwin*)
    # Option + 左右矢印で単語移動（macOSターミナル向け）
    bindkey "^[[1;3C" forward-word
    bindkey "^[[1;3D" backward-word
    ;;
esac

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

## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases # aliased ls needs if file/dir completions work

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

alias h='history -16'
alias l='less'

export EDITOR=vim
typeset -U PATH
export PATH=/usr/local/bin:$PATH
export PATH=~/local/bin:$PATH
[ -d ~/.rbenv ] && export PATH=~/.rbenv/bin:$PATH
[ -d ~/.plenv ] && export PATH=~/.plenv/bin:$PATH
[ -d ~/.pyenv ] && export PATH=~/.pyenv/bin:$PATH
command -v rbenv >/dev/null && eval "$(rbenv init -)"
command -v plenv >/dev/null && eval "$(plenv init -)"
command -v pyenv >/dev/null && eval "$(pyenv init -)"

[ -d /opt/homebrew/opt/go/libexec/bin ] && export PATH=$PATH:/opt/homebrew/opt/go/libexec/bin

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

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
plugins=(git zsh-completions zsh-autosuggestions zsh-syntax-highlighting fzf-tab)

typeset -U fpath
fpath=(${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-completions/src(N) $fpath)

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

command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
