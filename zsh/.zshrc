export LANG=en_US.UTF-8
# # tmux {{{
# # if `which tmux > /dev/null 2>&1`; then 
# #     if [ $SHLVL = 1 ]; then
# #         tmux
# #     fi
# # fi
# # }}}
# CLI tool install {{{
#   __                           
#  |  |--..----..-----..--.--.--.
#  |  _  ||   _||  -__||  |  |  |
#  |_____||__|  |_____||________|
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
#          __  __   
#  .-----.|__||  |_ 
#  |  _  ||  ||   _|
#  |___  ||__||____|
#  |_____|          
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
#                 __               
#  .-----..-----.|  |.--.--..-----.
#  |-- __||  _  ||  ||  |  ||  _  |
#  |_____||   __||__||_____||___  |
#         |__|              |_____|
export ZPLUG_HOME=$HOME/.zplug
[ -f $ZPLUG_HOME/init.zsh ] && source $ZPLUG_HOME/init.zsh
if `which zplug > /dev/null 2>&1`; then
    echo "zplug: already installed"
else
    echo "zplug: installing..."
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
    echo "zplug: done."
fi
#    ___          ___ 
#  .'  _|.-----..'  _|
#  |   _||-- __||   _|
#  |__|  |_____||__|  
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
# keybind :vim {{{
#          __                                    __        
#  .--.--.|__|.--------.    .--------..-----..--|  |.-----.
#  |  |  ||  ||        |    |        ||  _  ||  _  ||  -__|
#   \___/ |__||__|__|__|    |__|__|__||_____||_____||_____|
#                                                          
bindkey -v
bindkey "^N" menu-complete
bindkey -M viins 'jj' vi-cmd-mode
export LC_ALL='en_US.UTF-8'
# }}}
# prompt {{{
#                                        __   
#  .-----..----..-----..--------..-----.|  |_ 
#  |  _  ||   _||  _  ||        ||  _  ||   _|
#  |   __||__|  |_____||__|__|__||   __||____|
#  |__|                          |__|         
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats '%{'${fg[red]}'%}[%s %b] %{'$reset_color'%}'
setopt prompt_subst

# promptを表示する直前に実行されるのhook関数
precmd () {
  LANG=en_US.UTF-8 vcs_info
  PROMPT='%{${fg[yellow]}%}[%n@%m] %{${fg[blue]}%} %~ %{$reset_color%}
%% '
  RPROMPT='%{${fg[green]}%}${vcs_info_msg_0_}%{$reset_color%}'
}
# }}}
# zplug {{{
#                 __                                  __    __    __               
#  .-----..-----.|  |.--.--..-----.    .-----..-----.|  |_ |  |_ |__|.-----..-----.
#  |-- __||  _  ||  ||  |  ||  _  |    |__ --||  -__||   _||   _||  ||     ||  _  |
#  |_____||   __||__||_____||___  |    |_____||_____||____||____||__||__|__||___  |
#         |__|              |_____|                                         |_____|
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

# install
if ! zplug check; then
    zplug install
fi

zplug load --verbose
# }}}
# auto-suggestions {{{
bindkey '^a' autosuggest-accept
bindkey '^e' autosuggest-execute
# }}}
# Docker fzf (customized) {{{
#   _____                __                       ___          ___ 
#  |     \ .-----..----.|  |--..-----..----.    .'  _|.-----..'  _|
#  |  --  ||  _  ||  __||    < |  -__||   _|    |   _||-- __||   _|
#  |_____/ |_____||____||__|__||_____||__|      |__|  |_____||__|  
#                                                                                         
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
#    ___          ___      __     __            __          __                  
#  .'  _|.-----..'  _|    |  |--.|__|.-----..--|  | ______ |  |--..-----..--.--.
#  |   _||-- __||   _|    |  _  ||  ||     ||  _  ||______||    < |  -__||  |  |
#  |__|  |_____||__|      |_____||__||__|__||_____|        |__|__||_____||___  |
#                                                                        |_____|
fpath=($HOME/.zsh/anyframe(N-/) $fpath)
autoload -Uz anyframe-init
anyframe-init

bindkey '^b' gcheckout
bindkey '^p' anyframe-widget-put-history
bindkey '^k' anyframe-widget-kill

bindkey '^xb' anyframe-widget-insert-git-branch
bindkey '^f' anyframe-widget-insert-filename

bindkey '^ws' dstop
bindkey '^wr' drm
bindkey '^wi' drmi
# }}}
# for Docker {{{
#    ___                   _____                __                 
#  .'  _|.-----..----.    |     \ .-----..----.|  |--..-----..----.
#  |   _||  _  ||   _|    |  --  ||  _  ||  __||    < |  -__||   _|
#  |__|  |_____||__|      |_____/ |_____||____||__|__||_____||__|  
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
# git fzf {{{
gcheckout() {
    if [ ! -d .git/ ]; then
        echo "gcheckout: No such .git/ in current dir"
        return
    fi

    selected=`git branch -a | awk 'BEGIN{}{print $1}' | grep -v 'HEAD' | grep -v '\*' | awk 'BEGIN{idx=1;FS="/"}{if($1=="remotes" && $2=="origin"){idx=3};for(i=idx;i<NF;i++){printf "%s/", $i}; print $NF}' | sort | uniq | fzf`
    git checkout ${selected}
}

zle -N gcheckout
# }}}
# alias {{{
#          __  __               
#  .---.-.|  ||__|.---.-..-----.
#  |  _  ||  ||  ||  _  ||__ --|
#  |___._||__||__||___._||_____|
#                               
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

# stack
# alias ghc='stack ghc'
# alias ghci='stack ghci'
# alias runghc='stack runghc'

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
# export {{{
#   __     __         __                       
#  |  |--.|__|.-----.|  |_ .-----..----..--.--.
#  |     ||  ||__ --||   _||  _  ||   _||  |  |
#  |__|__||__||_____||____||_____||__|  |___  |
#                                       |_____|
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
#                                               
#  .-----..-----..--.--.    .--.--..---.-..----.
#  |  -__||     ||  |  |    |  |  ||  _  ||   _|
#  |_____||__|__| \___/      \___/ |___._||__|  
#                                               
export PYENV_ROOT=$HOME/.pyenv
export PKG_CONFIG_PATH=/usr/local/lib
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:
export XDG_CONFIG_HOME=$HOME/.config
export GOPATH=$HOME/go
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
# other {{{
#          __    __                 
#  .-----.|  |_ |  |--..-----..----.
#  |  _  ||   _||     ||  -__||   _|
#  |_____||____||__|__||_____||__|  
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

dir() {
    mkdir $1 && cd $_
}

# 画面の明かるさ調節 (ubuntuのみ)
if [ `uname` = "Linux" ]; then
    [ br = "" ] && br=0.5
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

    bindkey '^hx' brdown
    bindkey '^ha' brup
else
    echo "unnecessary brightness control functions"
fi
# }}}
