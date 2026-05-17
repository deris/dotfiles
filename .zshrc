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

case ${OSTYPE} in
  linux*) export GLFW_IM_MODULE=ibus ;;
esac

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

# ls color flag differs by OS (-G for macOS, --color=auto for Linux)
case ${OSTYPE} in
  darwin*) LS_COLOR=-G ;;
  linux*)  LS_COLOR=--color=auto ;;
esac

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls="ls -F $LS_COLOR"
alias ll="ls -aFhl $LS_COLOR"
alias la="ls -aF $LS_COLOR"
alias lt="ls -aFhlt $LS_COLOR | head -10"
alias less='less -M'
alias grep='grep -E --color'
alias g='git'
alias h='history -16'
alias l='less'

## PATH

typeset -U PATH
case ${OSTYPE} in
  darwin*)
    export PATH=/opt/homebrew/bin:$PATH
    export PATH=$HOME/.local/bin:$PATH
    ;;
  linux*)
    export PATH=/usr/local/bin:$PATH
    ;;
esac

# Ruby / Perl / Python version managers
[ -d ~/.rbenv ] && export PATH=~/.rbenv/bin:$PATH
[ -d ~/.plenv ] && export PATH=~/.plenv/bin:$PATH
[ -d ~/.pyenv ] && export PATH=~/.pyenv/bin:$PATH
command -v rbenv >/dev/null && eval "$(rbenv init -)"
command -v plenv >/dev/null && eval "$(plenv init -)"
command -v pyenv >/dev/null && eval "$(pyenv init -)"

## Oh My Zsh

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-completions zsh-autosuggestions fast-syntax-highlighting fzf-tab)

typeset -U fpath
case ${OSTYPE} in
  darwin*) fpath=(/opt/homebrew/share/zsh/site-functions $fpath) ;;
esac
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
command -v fd >/dev/null && export FZF_DEFAULT_COMMAND='fd --type file --hidden --no-ignore'

export MCFLY_RESULTS=2000

if command -v mcfly >/dev/null; then
  eval "$(mcfly init zsh)"

  # --- スコア係数 ---
  _w_frequency=1.0
  _w_selected=5.0
  _w_recency=10.0
  _w_dir=3.0

  # --- 初期オプション ---
  _filter_exit_code=true
  _use_dir_weight=true

  function _fzf_mcfly_history() {
    local db_path
    if [[ -f "$HOME/.mcfly/history.db" ]]; then
      db_path="$HOME/.mcfly/history.db"
    elif [[ -f "$HOME/Library/Application Support/McFly/history.db" ]]; then
      db_path="$HOME/Library/Application Support/McFly/history.db"
    elif [[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/mcfly/history.db" ]]; then
      db_path="${XDG_DATA_HOME:-$HOME/.local/share}/mcfly/history.db"
    else
      zle -M "mcfly DB not found"
      return 1
    fi

    local state_file query_script toggle_fe toggle_ud now cur_dir safe_dir selected
    state_file=$(mktemp)
    query_script=$(mktemp)
    toggle_fe=$(mktemp)
    toggle_ud=$(mktemp)
    chmod +x "$query_script" "$toggle_fe" "$toggle_ud"

    now=$(date +%s)
    cur_dir=$(pwd)
    safe_dir="${cur_dir//\'/\'\'}"

    local init_fe=$([[ "$_filter_exit_code" == true ]] && echo 1 || echo 0)
    local init_ud=$([[ "$_use_dir_weight"   == true ]] && echo 1 || echo 0)
    echo "$init_fe $init_ud" > "$state_file"

    # クエリスクリプト（状態ファイルを読んでSQLを組み立てる）
    cat > "$query_script" << SCRIPT
#!/bin/zsh
read fe ud < "${state_file}"
where=\$([[ "\$fe" == 1 ]] && echo "WHERE exit_code = 0" || echo "")
dir_sql=\$([[ "\$ud" == 1 ]] && echo "+ SUM(CASE WHEN dir = '${safe_dir}' THEN 1.0 ELSE 0.0 END) * ${_w_dir}" || echo "")
sqlite3 "${db_path}" "
  SELECT cmd FROM (
    SELECT cmd,
      COUNT(*) * ${_w_frequency}
        + SUM(selected) * ${_w_selected}
        + ${_w_recency} / ((${now} - MAX(when_run)) / 86400.0 + 1.0)
        \${dir_sql}
      AS score
    FROM commands
    \${where}
    GROUP BY cmd
  )
  ORDER BY score DESC
  LIMIT 500
" 2>/dev/null
SCRIPT

    # 「成功のみ」トグルスクリプト（fzfアクションを出力する）
    cat > "$toggle_fe" << SCRIPT
#!/bin/zsh
read fe ud < "${state_file}"
[[ "\$fe" == 1 ]] && fe=0 || fe=1
echo "\$fe \$ud" > "${state_file}"
fe_s=\$([[ "\$fe" == 1 ]] && echo ON || echo OFF)
ud_s=\$([[ "\$ud" == 1 ]] && echo ON || echo OFF)
echo "reload(${query_script})+change-header(ctrl-e: 成功のみ[\${fe_s}]  ctrl-d: 現在dir優先[\${ud_s}])"
SCRIPT

    # 「現在dir優先」トグルスクリプト
    cat > "$toggle_ud" << SCRIPT
#!/bin/zsh
read fe ud < "${state_file}"
[[ "\$ud" == 1 ]] && ud=0 || ud=1
echo "\$fe \$ud" > "${state_file}"
fe_s=\$([[ "\$fe" == 1 ]] && echo ON || echo OFF)
ud_s=\$([[ "\$ud" == 1 ]] && echo ON || echo OFF)
echo "reload(${query_script})+change-header(ctrl-e: 成功のみ[\${fe_s}]  ctrl-d: 現在dir優先[\${ud_s}])"
SCRIPT

    local init_fe_s=$([[ $init_fe == 1 ]] && echo ON || echo OFF)
    local init_ud_s=$([[ $init_ud == 1 ]] && echo ON || echo OFF)

    selected=$("$query_script" \
      | fzf --no-sort --height 40% --reverse \
          --query "${LBUFFER}" \
          --header "ctrl-e: 成功のみ[${init_fe_s}]  ctrl-d: 現在dir優先[${init_ud_s}]" \
          --bind "ctrl-e:transform(${toggle_fe})" \
          --bind "ctrl-d:transform(${toggle_ud})" \
      2>/dev/null)

    rm -f "$state_file" "$query_script" "$toggle_fe" "$toggle_ud"

    if [[ -n "$selected" ]]; then
      LBUFFER="$selected"
      RBUFFER=""
    fi
    zle reset-prompt
  }

  zle -N _fzf_mcfly_history
  bindkey '^R' _fzf_mcfly_history
fi

if command -v zoxide >/dev/null; then
  eval "$(zoxide init zsh)"

  # zoxide wrapper: run pwd after z/zi
  function z() {
    __zoxide_z "$@" && pwd
  }

  function zi() {
    __zoxide_zi "$@" && pwd
  }
fi
