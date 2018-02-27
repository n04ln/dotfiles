export LANG=ja_JP.UTF-8

# キーバインドをviに
bindkey -v
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit
compinit 
autoload -Uz colors
colors

bindkey "^N" menu-complete
bindkey -M viins 'jj' vi-cmd-mode
export LC_ALL='ja_JP.UTF-8'

# アプリケーションの環境変数設定
source $HOME/env.zsh

# prompt {{{
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats '%{'${fg[red]}'%}[%s %b] %{'$reset_color'%}'
setopt prompt_subst

# promptを表示する直前に実行されるのhook関数
precmd () {
  LANG=en_US.UTF-8 vcs_info
  LOADAVG=$(sysctl -n vm.loadavg | perl -anpe '$_=$F[1]')
  PROMPT='%{${fg[yellow]}%}[%n@%m] %{${fg[blue]}%} %~ ($LOADAVG) %{$reset_color%}
%% '
  RPROMPT='%{${fg[green]}%}${vcs_info_msg_0_}%{$reset_color%}'
}
# }}}
# zplug {{{
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "wbinglee/zsh-wakatime"

# syntax
zplug "chrissicool/zsh-256color"
zplug "Tarrasch/zsh-colors"
zplug "ascii-soup/zsh-url-highlighter"

# program
zplug "voronkovich/mysql.plugin.zsh"

# other
zplug "zsh-users/zsh-syntax-highlighting", defer:3
zplug "zsh-users/zsh-completions"
zplug "mollifier/anyframe"
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux

zplug load --verbose
# }}}
# auto-suggestions {{{
bindkey '^a' autosuggest-accept
bindkey '^e' autosuggest-execute
# }}}
# Docker fzf (customized) {{{
dstop() {
    selected=`docker ps | sed 1d | fzf -m | awk '{print $1}'`
    if [ `echo ${selected} | wc -w` -eq 0 ]; then
        return
    fi

    docker stop $selected
}
drm() {
    selected=`docker ps -a | sed 1d | fzf -m | awk '{print $1}'`
    if [ `echo ${selected} | wc -w` -eq 0 ]; then
        return
    fi

    docker rm -f $selected
}
drmi() {
    selected=`docker images | sed 1d | fzf -m | awk '{print $3}'`
    if [ `echo ${selected} | wc -w` -eq 0 ]; then
        return
    fi

    docker rmi -f $selected
}
dsh() {
    selected=`docker ps | sed 1d | fzf -m | awk '{print $1}'`
    if [ `echo ${selected} | wc -w` -eq 0 ]; then
        return
    fi

    docker exec -it $selected sh
}
dlogs() {
    selected=`docker ps -a | sed 1d | fzf -m | awk '{print $1}'`
    if [ `echo ${selected} | wc -w` -eq 0 ]; then
        return
    fi

    docker logs $selected
}
zle -N dstop
zle -N drm
zle -N drmi
# }}}
# fzf {{{
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fpath=($HOME/.zsh/anyframe(N-/) $fpath)
autoload -Uz anyframe-init
anyframe-init
 
bindkey '^b' anyframe-widget-checkout-git-branch
bindkey '^p' anyframe-widget-put-history
bindkey '^k' anyframe-widget-kill

bindkey '^xb' anyframe-widget-insert-git-branch
bindkey '^f' anyframe-widget-insert-filename

bindkey '^ws' dstop
bindkey '^wr' drm
bindkey '^wi' drmi

# }}}
# for Docker {{{
_check_to_exec_comand() {
    read yn\?${1}
    case "${yn}" in
        [Yy] )
            return 1 # execute: value is false
            ;;
        *)
            return 0 # abort: value is true
    esac
}

_drmall() {
    if [ `echo ${1} | wc -w` -eq 0 ]; then
        return
    fi

    echo ${1} | while read item
    do
        docker rm -f ${item}
    done
}
drmall() {
    if _check_to_exec_comand "Do you really execute drmall? (it means docker rm -f all-containers) [Y/n]" ; then
        echo "abort."
        return
    fi

    if _check_to_exec_comand "All container is already stoped? [Y/n]" ; then
        echo "abort."
        return
    fi

    if [ `docker ps | sed 1d | wc -l` -ne 0 ]; then
        echo "does not stopped all containers. abort."
        return
    fi

    all=`docker ps -a | sed 1d | awk '{print $1}'`
    _drmall ${all}
}

_dstopall() {
    if [ `echo ${1} | wc -w` -eq 0 ]; then
        return
    fi

    echo ${1} | while read item
    do
        docker stop ${item}
    done
}
dstopall() {
    if _check_to_exec_comand "Do you really execute dstopall? (it means docker stop all-active-container) [Y/n]" ; then
        echo "abort."
        return
    fi

    all=`docker ps | sed 1d | awk '{print $1}'`
    _dstopall ${all}
}
# }}}
# alias {{{
alias s='source ~/.zshrc'
alias ls='ls -F'
alias la='ls -la'
alias rm='rm -i'

# docker
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dim='docker images'

# git
alias ga='git add .'
alias gc='git commit'
alias gs='git status'
alias gp='git push'
alias gP='git pull'
alias gd='git diff'

# alias ghc='stack ghc'
# alias ghci='stack ghci'
# alias runghc='stack runghc'
alias -g B='|bash' 
alias -g C='|pbcopy'
alias -g G='|grep -e'
alias -g L='|less'
alias -g W='|wc'
# }}}
# export {{{
# history
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

# zplug
export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh

# exenv (for elixir)
export PATH="$HOME/.exenv/bin:$PATH"
eval "$(exenv init -)"

export PKG_CONFIG_PATH=/usr/local/lib
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:
export XDG_CONFIG_HOME=$HOME/.config
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=/usr/local/Cellar/git/2.12.2:$PATH
export PATH=${PATH}:${GOPATH}/bin
export PATH=$HOME/.protoc/bin:$PATH
export PATH=$PATH:/Users/noah/.nodebrew/current/bin
export PATH=$PATH:$HOME/.rbenv/versions/2.4.1/bin
export PATH=$PATH:$HOME/.bin/z3-4.5.0-x64-osx-10.11.6/bin
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/shims:$PATH
export PATH=$PYENV_ROOT/versions/3.6.1/bin:$PATH
export PATH=/usr/local/bin:$PATH

# fzf
export FZF_DEFAULT_OPTS="--reverse --height=20"
# }}}
# other {{{
setopt no_beep
setopt auto_cd
setopt correct
# }}}
