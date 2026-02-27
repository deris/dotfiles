## Environment

export LANG=ja_JP.UTF-8
export EDITOR=vim

## Shell options

setopt auto_cd              # cd by typing directory name
setopt auto_pushd           # push directories to stack on cd
setopt pushd_ignore_dups    # no duplicate entries in directory stack
setopt nocorrect            # disable command auto-correction
setopt nonomatch            # pass unmatched globs as literal strings
setopt list_packed          # compact completion list
setopt noautoremoveslash    # keep trailing slash on completions
setopt nolistbeep no_beep   # disable all beep sounds
setopt ignoreeof            # disable Ctrl+D shell exit
setopt interactivecomments  # allow # comments in interactive shell
setopt extended_glob        # enable extended glob patterns
unsetopt promptcr           # allow output without trailing newline

umask 002

## History

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE
setopt hist_ignore_dups     # ignore consecutive duplicate commands
setopt hist_ignore_all_dups # remove older duplicate entries
setopt hist_reduce_blanks   # strip extra whitespace from commands
setopt hist_verify          # confirm history expansion before executing
setopt share_history        # share history across sessions

## Keybindings

stty -ixon  # disable XON/XOFF to allow ^S for history search
bindkey -e  # emacs key bindings

# ^P/^N: history search matching current line prefix
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

export WORDCHARS=""         # treat symbols as word delimiters
bindkey '^I' complete-word  # Tab: complete word

case ${OSTYPE} in
  darwin*)
    bindkey "^[[1;3C" forward-word   # Option+Right: forward word
    bindkey "^[[1;3D" backward-word  # Option+Left: backward word
    ;;
esac

## Completion

setopt complete_aliases  # enable completion for aliased commands

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

## Aliases

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

## PATH

typeset -U PATH
export PATH=/usr/local/bin:$PATH
export PATH=~/local/bin:$PATH

# Ruby / Perl / Python version managers
[ -d ~/.rbenv ] && export PATH=~/.rbenv/bin:$PATH
[ -d ~/.plenv ] && export PATH=~/.plenv/bin:$PATH
[ -d ~/.pyenv ] && export PATH=~/.pyenv/bin:$PATH
command -v rbenv >/dev/null && eval "$(rbenv init -)"
command -v plenv >/dev/null && eval "$(plenv init -)"
command -v pyenv >/dev/null && eval "$(pyenv init -)"

# Go
[ -d /opt/homebrew/opt/go/libexec/bin ] && export PATH=$PATH:/opt/homebrew/opt/go/libexec/bin

## Oh My Zsh

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-completions zsh-autosuggestions zsh-syntax-highlighting fzf-tab)

typeset -U fpath
fpath=(${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-completions/src(N) $fpath)

[ -f "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"

## Tmux auto-start

is_screen_running() {
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

## Additional configs

[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
