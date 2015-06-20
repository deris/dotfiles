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
bindkey "^W" backward-kill-word
bindkey "^[^H" backward-kill-word
bindkey "^[D" kill-word
bindkey "^[d" kIll-word
export WORDCHARS=""

bindkey -a 'q' push-line

bindkey '^I' complete-word # complete on tab, leave expansion to _expand

## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=1000000
HISTFILESIZE=$HISTSIZE
SAVEHIST=$HISTSIZE

# ignore duplication command history list
#
setopt hist_ignore_dups

# share command history data
#
setopt share_history

## Completion configuration
#
autoload -U compinit
compinit -u

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
    alias ls="ls -G -w"
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

set -o vi

export EDITOR=vim
export VIM_HOME=~/.vim/
typeset -U PATH
export PATH=/usr/local/bin:$PATH
export PATH=~/local/bin:$PATH
export PATH=~/.cabal/bin:$PATH
export PATH=$PATH:`find /Applications/Xcode.app -name swift|grep bin|xargs -I{} dirname {}`
export PATH=~/.plenv/bin:$PATH
eval "$(rbenv init -)"
eval "$(plenv init -)"

compdef _mojoliciousCmd mojo
function _mojoliciousCmd {
  local -a subcommands
  if (( CURRENT == 2 ));then
    subcommands=(
      'cgi:Start application with CGI.' \
      'cpanify:Upload distribution to CPAN.' \
      'daemon:Start application with HTTP 1.1 and WebSocket server.' \
      'eval:Run code against application.' \
      'generate:Generate files and directories from templates.' \
      'get:Perform HTTP 1.1 request.' \
      'inflate:Inflate embedded files to real files.' \
      'psgi:Start application with PSGI.' \
      'routes:Show available routes.' \
      'test:Run unit tests.' \
      'version:Show versions of installed modules.' \
      'help:Get more information on a specific command.:option:(cgi cpanify daemon eval generate get inflate psgi routes test version)' \
      '-h:Get more information on a specific command.:option:(cgi cpanify daemon eval generate get inflate psgi routes test version)' \
      '--help:Get more information on a specific command.:option:(cgi cpanify daemon eval generate get inflate psgi routes test version)' \
      '--home:Path to your applications home directory, defaults to the value of MOJO_HOME or auto detection.' \
      '-m:Run mode of your application, defaults to the value of MOJO_MODE or "development".' \
      '--mode:Run mode of your application, defaults to the value of MOJO_MODE or "development".' \
    )
    _describe -t commands "subcommand" subcommands
  #else
    #_files
  fi

  return 1;
}

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

# run terminal multiplexer when zsh start.
is_screen_running() {
  # tscreen also uses this varariable.
  [ ! -z "$WINDOW" ]
}
is_tmux_runnning() {
  [ ! -z "$TMUX" ]
}
is_screen_or_tmux_running() {
  is_screen_running || is_tmux_runnning
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

