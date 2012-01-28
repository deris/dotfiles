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
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep

## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes
# to end of it)
#
#bindkey -e

# vi like keybind
bindkey -v               # vi key bindings

# historical backward/forward search with linehead string binded to ^P/^N
#
#autoload history-search-end
#zle -N history-beginning-search-backward-end history-search-end
#zle -N history-beginning-search-forward-end history-search-end
#bindkey "^p" history-beginning-search-backward-end
#bindkey "^n" history-beginning-search-forward-end
#bindkey "\\ep" history-beginning-search-backward-end
#bindkey "\\en" history-beginning-search-forward-end


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
#bindkey "^N" history-beginning-search-forward-end
bindkey "^N" down-line-or-history
bindkey "^O" accept-line-and-down-history
#bindkey "^P" history-beginning-search-backward-end
bindkey "^P" up-line-or-history
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

bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand

## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data

## Completion configuration
#
autoload -U compinit
compinit

## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -G -w"
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls -FG'
alias ll='ls -aFGhl'
alias la='ls -aFG'
alias less='less -M'
alias grep='grep -E --color'
#alias mysql='mysql5'
#alias mysqladmin='mysqladmin5'

alias apache_start='sudo /opt/local/apache2/bin/apachectl start'
alias apache_restart='sudo /opt/local/apache2/bin/apachectl restart'
alias apache_stop='sudo /opt/local/apache2/bin/apachectl stop'
alias mysql_start='sudo /opt/local/lib/mysql5/bin/mysqld_safe &'
alias mysql_stop='sudo /opt/local/bin/mysqladmin5 -u root -p shutdown'

#alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
#alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias gvim='mvim --remote-tab-silent'

alias rake='$HOME/.gem/ruby/1.8/bin/rake'

alias cpan='cpanm'

#alias cpanoutdated='perl -MCPAN -e "CPAN::Shell->r"'
#alias cpaninstalled='perl -MExtUtils::Installed -le "print join \"\n\" => sort ExtUtils::Installed->new->modules;"'

alias h='history 16'
alias l='less'
alias memo='vi $HOME/Documents/memo/memo.txt'

#set -o emacs
set -o vi

#source $HOME/perl5/perlbrew/etc/bashrc

export EDITOR=vim
export VIM_HOME=$HOME/.vim/
export MAVEN2_HOME=/opt/local/share/java/maven2
export PATH=/usr/local/bin:$MAVEN2_HOME/bin:$PATH 

function listMavenCompletions { reply=(cli:execute cli:execute-phase archetype:generate compile clean install test test-compile deploy package cobertura:cobertura jetty:run eclipse:eclipse -Dmaven.test.skip=true -DarchetypeCatalog=http://tapestry.formos.com/maven-snapshot-repository -Dtest= `if [ -d ./src ] ; then find ./src -type f | grep -v svn | sed 's?.*/\([^/]*\)\..*?-Dtest=\1?' ; fi`); }
compctl -K listMavenCompletions mvn

function listMacPortsCompletions { reply=(activate archive archivefetch build cat cd checksum clean configure contents deactivate dependents deps destroot dir distcheck distfiles dmg dpkg echo ed edit exit extract fetch file gohome help info install installed lint list livecheck load location log mdmg mirror mpkg notes outdated patch pkg platform portpkg provides quit rdependents rdeps rpm search select selfupdate setrequested srpm submit sync test unarchive uninstall unload unsetrequested upgrade url usage variants version work); }
compctl -K listMacPortsCompletions port

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
  export LSCOLORS=ExFxCxdxBxegedabagacad
  export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
  ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm*)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  }
  export LSCOLORS=exfxcxdxbxegedabagacad
  export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
esac

source $HOME/perl5/perlbrew/etc/bashrc

## load user .zshrc configuration file
#
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

