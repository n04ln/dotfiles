export LANG=en_US.UTF-8
# tmux {{{
#    __                      
#   / /_____ ___  __  ___  __
#  / __/ __ `__ \/ / / / |/_/
# / /_/ / / / / / /_/ />  <  
# \__/_/ /_/ /_/\__,_/_/|_|  
#                            
# if `which tmux > /dev/null 2>&1`; then
#     if [ $SHLVL = 1 ]; then
#         tmux
#     fi
# fi
# }}}
# export {{{
#     __    _      __                  
#    / /_  (_)____/ /_____  _______  __
#   / __ \/ / ___/ __/ __ \/ ___/ / / /
#  / / / / (__  ) /_/ /_/ / /  / /_/ / 
# /_/ /_/_/____/\__/\____/_/   \__, /  
#                             /____/   
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
#     _______   ___    __   _    _____    ____ 
#    / ____/ | / / |  / /  | |  / /   |  / __ \
#   / __/ /  |/ /| | / /   | | / / /| | / /_/ /
#  / /___/ /|  / | |/ /    | |/ / ___ |/ _, _/ 
# /_____/_/ |_/  |___/     |___/_/  |_/_/ |_|  
#                                              
export PYENV_ROOT=$HOME/.pyenv
export PKG_CONFIG_PATH=/usr/local/lib
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:
export XDG_CONFIG_HOME=$HOME/.config
export GOPATH=$HOME/go
export GOSAND=$GOPATH/src/github.com/NoahOrberg/sandbox
export GHQPATH=$HOME/.ghq/github.com
export PATH=/Users/noah/.goenv/shims:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$PYENV_ROOT/shims:$PATH
# export PATH=/usr/local/Cellar/git/2.12.2:$PATH
# export PATH=$PYENV_ROOT/versions/3.6.1/bin:$PATH
# export PATH=$HOME/.protoc/bin:$PATH
# export PATH=$HOME/.nodebrew/current/bin:$PATH
# export PATH=$HOME/.rbenv/versions/2.4.1/bin:$PATH
# export PATH=$HOME/.bin/z3-4.5.0-x64-osx-10.11.6/bin:$PATH

# }}}
# CLI tool and some plugin install {{{
#     __                     
#    / /_  ________ _      __
#   / __ \/ ___/ _ \ | /| / /
#  / /_/ / /  /  __/ |/ |/ / 
# /_.___/_/   \___/|__/|__/  
#                            
if `which brew > /dev/null 2>&1`; then
    echo "brew: already installed"
else
    if [ `uname` = "Darwin" ]; then
        echo "brew: installing..."
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        echo "brew: done."
    elif [ `uname` = "Linux" ]; then
        echo "brew: unnecessary install"
    else
        echo "cannot detect OS"
    fi
fi
#           _ __ 
#    ____ _(_) /_
#   / __ `/ / __/
#  / /_/ / / /_  
#  \__, /_/\__/  
# /____/         
if `which git > /dev/null 2>&1`; then
    echo "git: already installed"
else
    if [ `uname` = "Darwin" ]; then
        echo "git: installing..."
        brew install git
        echo "git: done."
    elif [ `uname` = "Linux" ]; then
        echo "git: installing..."
        apt-get install git
        echo "git: done."
    else
        echo "cannot detect OS"
    fi
fi
#               __           
#  ____  ____  / /_  ______ _
# /_  / / __ \/ / / / / __ `/
#  / /_/ /_/ / / /_/ / /_/ / 
# /___/ .___/_/\__,_/\__, /  
#    /_/            /____/   
export ZPLUG_HOME=$HOME/.zplug
[ -f $ZPLUG_HOME/init.zsh ] && source $ZPLUG_HOME/init.zsh
if `which zplug > /dev/null 2>&1`; then
    echo "zplug: already installed"
else
    echo "zplug: installing..."
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
    echo "zplug: done."
fi
#     ____      ____
#    / __/___  / __/
#   / /_/_  / / /_  
#  / __/ / /_/ __/  
# /_/   /___/_/     
#                   
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if `which fzf > /dev/null 2>&1`; then
    echo "fzf: already installed"
else
    echo "fzf: installing..."
    git clone https://github.com/junegunn/fzf.git $HOME/.fzf
    $HOME/.fzf/install
    echo "fzf: done."
fi
export FZF_DEFAULT_OPTS="--reverse --height=20"
# }}}
# keybind: vim {{{
#         _                                  __   
#  _   __(_)___ ___     ____ ___  ____  ____/ /__ 
# | | / / / __ `__ \   / __ `__ \/ __ \/ __  / _ \
# | |/ / / / / / / /  / / / / / / /_/ / /_/ /  __/
# |___/_/_/ /_/ /_/  /_/ /_/ /_/\____/\__,_/\___/ 
#                                                 
bindkey -v
bindkey "^N" menu-complete
bindkey -M viins 'jj' vi-cmd-mode
export LC_ALL='en_US.UTF-8'
# }}}
# prompt {{{
#                                       __ 
#     ____  _________  ____ ___  ____  / /_
#    / __ \/ ___/ __ \/ __ `__ \/ __ \/ __/
#   / /_/ / /  / /_/ / / / / / / /_/ / /_  
#  / .___/_/   \____/_/ /_/ /_/ .___/\__/  
# /_/                        /_/           
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats '%{'${fg[red]}'%}[%s %b] %{'$reset_color'%}'
setopt prompt_subst

# mode表示
function zle-line-init zle-keymap-select {
    case $KEYMAP in
        vicmd)
            PROMPT='%{${fg[yellow]}%}[%n@%m]%{$reset_color%}%{${fg[white]}${bg[yellow]}%}[NORMAL]%{$reset_color%} %{${fg[blue]}%} %~ %{$reset_color%}
%% '
            ;;
        main|viins|opp)
            PROMPT='%{${fg[yellow]}%}[%n@%m]%{$reset_color%}%{${fg[cyan]}${bg[blue]}%}[INSERT]%{$reset_color%} %{${fg[blue]}%} %~ %{$reset_color%}
%% '
            ;;
        vivis)
            PROMPT='%{${fg[yellow]}%}[%n@%m]%{$reset_color%}%{${fg[white]}${bg[magenta]}%}[VISUAL]%{$reset_color%} %{${fg[blue]}%} %~ %{$reset_color%}
%% '
            ;;
        *)
            PROMPT='%{${fg[yellow]}%}[%n@%m]%{$reset_color%}%{${fg[white]}${bg[green]}%}[${KEYMAP}]%{$reset_color%} %{${fg[blue]}%} %~ %{$reset_color%}
%% '
            ;;
    esac
    LANG=en_US.UTF-8 vcs_info
    RPROMPT='%{${fg[green]}%}${vcs_info_msg_0_}%{$reset_color%}'
    zle reset-prompt
    zle -R -c
}

zle -N zle-line-init
zle -N zle-keymap-select
# }}}
# zplug {{{
#               __           
#  ____  ____  / /_  ______ _
# /_  / / __ \/ / / / / __ `/
#  / /_/ /_/ / / /_/ / /_/ / 
# /___/ .___/_/\__,_/\__, /  
#    /_/            /____/   
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
zplug "b4b4r07/zsh-vimode-visual", defer:3
zplug "hchbaw/opp.zsh"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "mollifier/anyframe"
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux

# install
if ! zplug check; then
    zplug install
fi

zplug load --verbose
# }}}
# initialize anyframe {{{
#     ____      _ __                       ____                        
#    /  _/___  (_) /_   ____ _____  __  __/ __/________ _____ ___  ___ 
#    / // __ \/ / __/  / __ `/ __ \/ / / / /_/ ___/ __ `/ __ `__ \/ _ \
#  _/ // / / / / /_   / /_/ / / / / /_/ / __/ /  / /_/ / / / / / /  __/
# /___/_/ /_/_/\__/   \__,_/_/ /_/\__, /_/ /_/   \__,_/_/ /_/ /_/\___/ 
#                                /____/                                
fpath=($HOME/.zsh/anyframe(N-/) $fpath)
autoload -Uz anyframe-init
anyframe-init
# }}}
# for fzf (customized) {{{
#     ____      ____
#    / __/___  / __/
#   / /_/_  / / /_  
#  / __/ / /_/ __/  
# /_/   /___/_/     
#                   
dstop() {
    selected=`docker ps | sed 1d | fzf -m | awk '{print $1}'`
    [ `echo ${selected} | wc -w` -eq 0 ] && return
    docker stop $selected

    zle reset-prompt
    zle -R -c
}
drm() {
    selected=`docker ps -a | sed 1d | fzf -m | awk '{print $1}'`
    [ `echo ${selected} | wc -w` -eq 0 ] && return
    docker rm -f $selected

    zle reset-prompt
    zle -R -c
}
drmi() {
    selected=`docker images | sed 1d | fzf -m | awk '{print $3}'`
    [ `echo ${selected} | wc -w` -eq 0 ] && return
    docker rmi -f $selected

    zle reset-prompt
    zle -R -c
}
dsh() {
    selected=`docker ps | sed 1d | fzf -m | awk '{print $1}'`
    [ `echo ${selected} | wc -w` -eq 0 ] && return
    docker exec -it $selected sh

    zle reset-prompt
    zle -R -c
}
dlogs() {
    selected=`docker ps -a | sed 1d | fzf -m | awk '{print $1}'`
    [ `echo ${selected} | wc -w` -eq 0 ] && return
    docker logs $selected

    zle reset-prompt
    zle -R -c
}
checkout_gbranch() {
    [ ! -d .git ] && return 0
    selected=`git branch -a | awk 'BEGIN{}{print $1}' | grep -v 'HEAD' | grep -v '\*' | awk 'BEGIN{idx=1;FS="/"}{if($1=="remotes" && $2=="origin"){idx=3};for(i=idx;i<NF;i++){printf "%s/", $i}; print $NF}' | sort | uniq | fzf`
    [ "${selected}" = "" ] && return 0
    git checkout ${selected}

    zle reset-prompt
    zle -R -c
}
put_gbranch() {
    [ ! -d .git ] && return 0
    selected=`git branch -a | awk 'BEGIN{}{print $1}' | grep -v 'HEAD' | grep -v '\*' | awk 'BEGIN{idx=1;FS="/"}{if($1=="remotes" && $2=="origin"){idx=3};for(i=idx;i<NF;i++){printf "%s/", $i}; print $NF}' | sort | uniq | fzf`
    [ "${selected}" = "" ] && return 0
    LBUFFER+=${selected}
    CURSOR=$#LBUFFER

    zle reset-prompt
    zle -R -c
}
cd_gopath() {
    selected=`for dir in $(ls $GOPATH/src/github.com);do for dir2 in $(ls $GOPATH/src/github.com/${dir});do echo ${dir}${dir2}; done; done | fzf`
    [ "${selected}" = "" ] && return 0
    cd $GOPATH/src/github.com/${selected}

    zle reset-prompt
    zle -R -c
}
cd_ghq() {
    selected=`for dir in $(ls $HOME/.ghq/github.com);do for dir2 in $(ls $HOME/.ghq/github.com/${dir});do echo ${dir}${dir2}; done; done | fzf`
    [ "${selected}" = "" ] && return 0
    cd $HOME/.ghq/github.com/${selected}

    zle reset-prompt
    zle -R -c
}
put_gopath() {
    selected=`for dir in $(ls $GOPATH/src/github.com);do for dir2 in $(ls $GOPATH/src/github.com/${dir});do echo ${dir}${dir2}; done; done | fzf`
    [ "${selected}" = "" ] && return 0
    echo $selected
    LBUFFER+=$GOPATH/src/github.com/${selected}
    CURSOR=$#LBUFFER

    zle reset-prompt
    zle -R -c
}
put_ghq() {
    selected=`for dir in $(ls $HOME/.ghq/github.com);do for dir2 in $(ls $HOME/.ghq/github.com/${dir});do echo ${dir}${dir2}; done; done | fzf`
    [ "${selected}" = "" ] && return 0
    LBUFFER+=$GHQPATH/${selected}
    CURSOR=$#LBUFFER

    zle reset-prompt
    zle -R -c
}
cd_dirhist() {
    selected=`dirs -pl | sort | uniq | awk 'BEGIN{FS=" "}{print $1}' | fzf`
    cd ${selected} > /dev/null 2>&1

    zle reset-prompt
    zle -R -c
}


zle -N dstop
zle -N drm
zle -N drmi
zle -N dsh
zle -N dlogs
zle -N checkout_gbranch
zle -N put_gbranch
zle -N cd_gopath
zle -N cd_ghq
zle -N put_gopath
zle -N put_ghq
zle -N cd_dirhist
# }}}
# for Docker {{{
#     ____              ____             __            
#    / __/___  _____   / __ \____  _____/ /_____  _____
#   / /_/ __ \/ ___/  / / / / __ \/ ___/ //_/ _ \/ ___/
#  / __/ /_/ / /     / /_/ / /_/ / /__/ ,< /  __/ /    
# /_/  \____/_/     /_____/\____/\___/_/|_|\___/_/     
#                                                      
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
# support widgets {{{
# }}}
# alias {{{
#     ___    ___           
#    /   |  / (_)___ ______
#   / /| | / / / __ `/ ___/
#  / ___ |/ / / /_/ (__  ) 
# /_/  |_/_/_/\__,_/____/  
#                          
alias s='exec $SHELL -l'
alias ls='ls -F'
alias la='ls -la'
alias rm='rm -i'
alias emacs='emacs -nw'

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

# ghq
alias cdg='cd ~/.ghq/github.com/$_'

# stack
alias ghc='stack ghc'
alias ghci='stack ghci'
alias runghc='stack runghc'

# global alias
alias -g B='|bash'
if [ `uname` = "Darwin" ]; then
    alias -g C='|pbcopy'
elif [ `uname` = "Linux" ]; then
    alias -g C='|xsel --clipboard --input'
fi
alias -g G='|grep -e'
alias -g L='|less'
alias -g W='|wc'
# }}}
# other {{{
#    ____  __  __             
#   / __ \/ /_/ /_  ___  _____
#  / / / / __/ __ \/ _ \/ ___/
# / /_/ / /_/ / / /  __/ /    
# \____/\__/_/ /_/\___/_/     
#                             
# アプリケーションの環境変数設定
source $HOME/env.zsh

# 補完、色つけなど
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit
compinit
autoload -Uz colors
colors

setopt no_beep
setopt auto_cd
setopt correct

# `cd` behave `pushd`
setopt auto_pushd

dir() {
    mkdir $1 && cd $_
}

# 画面の明かるさ調節 (ubuntuのみ)
if [ `uname` = "Linux" ]; then
    [ ${br:-default} = "default" ] && br=1.0
    dtarget=`xrandr | grep " connected" | awk 'BEGIN{FS=" "}{print $1}'`
    xrandr --output ${dtarget} --brightness ${br}
    echo "${dtarget}: brightness is ${br}"

    brdown() {
        if [ `echo "${br} > 0.1" | bc` = 1 ]; then
            br=`echo "${br} - 0.05" | bc`
        fi
        _brightness
    }
    brup() {
        if [ `echo "${br} < 1.0" | bc` = 1 ]; then
            br=`echo "${br} + 0.05" | bc`
        fi
        _brightness
    }
    _brightness() {
        xrandr --output ${dtarget} --brightness ${br}
        # brstatus
    }
    brstatus() {
        echo "${dtarget}: brightness is ${br}"
    }

    zle -N brdown
    zle -N brup
else
    echo "unnecessary brightness control functions"
fi

# coloring error output
# exec 2> >( read e; [ "${e}" != "" ] && $(echo ${e} | sed "s/^/${fg_bold[magenta]}/;s/$/${reset_color}/") )
# }}}
# bind widgets {{{
#     ____  _           __   _       ___     __           __      
#    / __ )(_)___  ____/ /  | |     / (_)___/ /___ ____  / /______
#   / __  / / __ \/ __  /   | | /| / / / __  / __ `/ _ \/ __/ ___/
#  / /_/ / / / / / /_/ /    | |/ |/ / / /_/ / /_/ /  __/ /_(__  ) 
# /_____/_/_/ /_/\__,_/     |__/|__/_/\__,_/\__, /\___/\__/____/  
#                                          /____/                 
bindkey '^a' autosuggest-accept
bindkey '^e' autosuggest-execute

bindkey '^b' checkout_gbranch
bindkey '^h' cd_ghq
bindkey '^j' cd_gopath
bindkey '^[B' put_gbranch # alt-shift-b
bindkey '^[H' put_ghq # alt-shift-h
bindkey '^[J' put_gopath # alt-shift-j

bindkey '^x' cd_dirhist

bindkey '^p' anyframe-widget-put-history
bindkey '^k' anyframe-widget-kill

bindkey '^ws' dstop
bindkey '^wr' drm
bindkey '^wi' drmi

# for Linux
bindkey '^rx' brdown
bindkey '^ra' brup

# }}}
# for Thinkpad X230 Tips {{{
#   ________    _       __                   __   __  _           
#  /_  __/ /_  (_)___  / /______  ____ _____/ /  / /_(_)___  _____
#   / / / __ \/ / __ \/ //_/ __ \/ __ `/ __  /  / __/ / __ \/ ___/
#  / / / / / / / / / / ,< / /_/ / /_/ / /_/ /  / /_/ / /_/ (__  ) 
# /_/ /_/ /_/_/_/ /_/_/|_/ .___/\__,_/\__,_/   \__/_/ .___/____/  
#                       /_/                        /_/            
# NOTE:
# To reverse touchpad scrolling
#   $ xinput -list
#     SynPS/2 Synaptics TouchPad id=11 [slave pointer (2)]
#   $ xinput list-props 11 | grep "Scrolling Distance"
#     Synaptics Scrolling Distance (285): 125, 125
#   $ xinput set-prop 11 285 -125 -125
# To set Wi-Fi
#   Show SSIDs
#     $ nmcli device wifi list
#   Connect Wi-Fi
#     $ nmcli device wifi connect 'SSID' password 'password' ifname wlan0
#   Status
#     $ nmcli device status
#   Disconnect
#     $ nmcli dev disconnect wlan0
# For sounds control
#   Initialization
#     alsactl init # initialization for sound device
#   Up
#     amixer sset Master 1%+
#     amixer sset Master 1db+
#   Down
#     amixer sset Master 1%-
#     amixer sset Master 1db-
# Only Ubuntu
if [ `uname` = "Linux" ]; then
    alias chrome=chromium-browser
    export PATH=$HOME/.bin/DevDocs-0.6.9/:$PATH
fi
# }}}
# COMPLETE! {{{
echo "complete!"
# }}}

