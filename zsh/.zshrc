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
export GHQPATH=$GOPATH/src
export PATH=$PATH:$HOME/.bin
export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH=/Users/noah/.goenv/shims:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$PYENV_ROOT/shims:$PATH
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH=$HOME/.protoc/bin:$PATH
# export PATH=/usr/local/Cellar/git/2.12.2:$PATH
# export PATH=$PYENV_ROOT/versions/3.6.1/bin:$PATH
# export PATH=$HOME/.protoc/bin:$PATH
# export PATH=$HOME/.nodebrew/current/bin:$PATH
# export PATH=$HOME/.rbenv/versions/2.4.1/bin:$PATH
# export PATH=$HOME/.bin/z3-4.5.0-x64-osx-10.11.6/bin:$PATH
# use Java 1.8
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
# for flutter
export PATH=$HOME/flutter/bin:$PATH
export PATH=$HOME/flutter/bin/cache/dart-sdk/bin:$PATH # what's cache dir?
export PATH=$HOME/.pub-cache/bin:$PATH
# }}}
# CLI tool and some plugin install {{{
install_tool() {
    # Usage:
    #   install_tool <COMMAND-NAME> \
    #     <INSTALL_COMMAND_FOR_MACOS> \
    #     <INSTALL_COMMAND_FOR_LINUX>
    #
    # Args:
    #     ${1} COMMAND-NAME
    #       ... The command name
    #           (e.g, git)
    #     ${2} INSTALL_COMMAND_FOR_MACOS
    #       ... The install command for Macintosh.
    #           This is string.
    #           (e.g, "brew install git"})
    #     ${3} INSTALL_COMMAND_FOR_LINUX
    #       ... The install command for Linux.
    #           This is string.
    #           (e.g, "apt-get install git")
    if $(which ${1} > /dev/null 2>&1); then
        echo "${1}: already installed"
    else
        if [ $(uname) = "Darwin" ]; then
            echo "${1}: installing..."
            eval "${2}"
            echo "${1}: installation done."
        elif [ $(uname) = "Linux" ]; then
            echo "${1}: installing..."
            [ "${3}" != "" ] && eval "${3}" || eval "${2}"
            echo "${1}: installation done."
        else
            echo "Cannot detect OS"
        fi
    fi
}
#     __                     
#    / /_  ________ _      __
#   / __ \/ ___/ _ \ | /| / /
#  / /_/ / /  /  __/ |/ |/ / 
# /_.___/_/   \___/|__/|__/  
install_tool brew \
    '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && brew update' \
    'echo unnecessary it'
#           _ __ 
#    ____ _(_) /_
#   / __ `/ / __/
#  / /_/ / / /_  
#  \__, /_/\__/  
# /____/         
install_tool git \
    'brew install git' 'apt-get install git'
#  ____  ____  / /_  ______ _
# /_  / / __ \/ / / / / __ `/
#  / /_/ /_/ / / /_/ / /_/ / 
# /___/ .___/_/\__,_/\__, /  
#    /_/            /____/   
export ZPLUG_HOME=$HOME/.zplug
[ -f $ZPLUG_HOME/init.zsh ] && source $ZPLUG_HOME/init.zsh
install_tool zplug \
    'git clone https://github.com/zplug/zplug $ZPLUG_HOME'
#     ____      ____
#    / __/___  / __/
#   / /_/_  / / /_  
#  / __/ / /_/ __/  
# /_/   /___/_/     
install_tool fzf \
    'git clone https://github.com/junegunn/fzf.git $HOME/.fzf'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--reverse --height=20"
# NOTE:
#   INSTALLATION SCRIPT for go, pt, jo, httpie, chrome-cli, ghq, neovim
#    ______    
#   / ____/___ 
#  / / __/ __ \
# / /_/ / /_/ /
# \____/\____/ 
install_tool go \
    "brew install go" "apt-get install go"
#            __ 
#     ____  / /_
#    / __ \/ __/
#   / /_/ / /_  
#  / .___/\__/  
# /_/ 
install_tool pt \
    "go get -u github.com/monochromegane/the_platinum_searcher/..."
#        _     
#       (_)___ 
#      / / __ \
#     / / /_/ /
#  __/ /\____/ 
# /___/        
install_tool jo \
    "brew install jo" \
    "apt-add-repository ppa:duggan/jo --yes; apt-get update -q; apt-get install jo"
#      __    __  __        _         
#    / /_  / /_/ /_____  (_)__      
#   / __ \/ __/ __/ __ \/ / _ \     
#  / / / / /_/ /_/ /_/ / /  __/     
# /_/ /_/\__/\__/ .___/_/\___/      
#              /_/                  
install_tool http \
    "brew install httpie" \
    "apt-get install httpie"
#          __                                         __    _ 
#   _____/ /_  _________  ____ ___  ___        _____/ /_  (_)
#  / ___/ __ \/ ___/ __ \/ __ `__ \/ _ \______/ ___/ __ \/ / 
# / /__/ / / / /  / /_/ / / / / / /  __/_____/ /__/ / / / /  
# \___/_/ /_/_/   \____/_/ /_/ /_/\___/      \___/_/ /_/_/   
install_tool chrome-cli \
    "brew install chrome-cli" \
    "echo cannnot install chrome-cli"
#           __         
#    ____ _/ /_  ____ _
#   / __ `/ __ \/ __ `/
#  / /_/ / / / / /_/ / 
#  \__, /_/ /_/\__, /  
# /____/         /_/   
install_tool ghq \
    "go get github.com/motemen/ghq"
#     _   __         _    ___         
#    / | / /__  ____| |  / (_)___ ___ 
#   /  |/ / _ \/ __ \ | / / / __ `__ \
#  / /|  /  __/ /_/ / |/ / / / / / / /
# /_/ |_/\___/\____/|___/_/_/ /_/ /_/ 
install_tool nvim \
    "brew install neovim" \
    "apt-get install neovim"
#     ____  __  _____  ____ _   __
#    / __ \/ / / / _ \/ __ \ | / /
#   / /_/ / /_/ /  __/ / / / |/ / 
#  / .___/\__, /\___/_/ /_/|___/  
# /_/    /____/                   
export NVIM_PYTHON_VERSION=3.6.6
install_tool pyenv \
    "brew install pyenv" \
    "git clone https://github.com/pyenv/pyenv.git ${HOME}/.pyenv"
# NOTE: initialize pyenv for NeoVim
eval "$(pyenv init -)"
[ "$(pyenv versions 2>/dev/null | grep ${NVIM_PYTHON_VERSION})" = "" ] && \
    pyenv install ${NVIM_PYTHON_VERSION}
[ "$(pip list 2>/dev/null | grep neovim)" = "" ] && \
    $(echo "${PYENV_ROOT}/versions/${NVIM_PYTHON_VERSION}/bin/pip3") \
        install neovim # NOTE: for neovim plugin
#         _                       __           
#  _   __(_)___ ___        ____  / /_  ______ _
# | | / / / __ `__ \______/ __ \/ / / / / __ `/
# | |/ / / / / / / /_____/ /_/ / / /_/ / /_/ / 
# |___/_/_/ /_/ /_/     / .___/_/\__,_/\__, /  
#                      /_/            /____/   
[ ! -e ${HOME}/.local/share/nvim/site/autoload/plug.vim ] && \
    echo "Plug: installing..." && \
    curl -fLo ${HOME}/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    echo "Plug: installation done." || \
    echo "Plug: already installed"
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
	if [[ "${KEYMAP}" == "vicmd" ]]; then
		echo -ne "\e[4 q"					# '\e[4 q' sets cursor to _
	elif [[ "${KEYMAP}" == "main" ]]; then  # main keymap is viins (INSERT mode)
        echo -ne "\e[2 q"					# '\e[2 q' sets cursor to | (bold)
	fi

    case $KEYMAP in
        vicmd)
            PROMPT=$'%{${fg[yellow]}%}[%n@%m]%{$reset_color%}%{${fg[white]}${bg[yellow]}%}[NORMAL]%{$reset_color%} %{${fg[blue]}%} %~ %{$reset_color%}\n%% '
            ;;
        main|viins|opp)
            PROMPT=$'%{${fg[yellow]}%}[%n@%m]%{$reset_color%}%{${fg[cyan]}${bg[blue]}%}[INSERT]%{$reset_color%} %{${fg[blue]}%} %~ %{$reset_color%}\n%% '
            ;;
        vivis)
            PROMPT=$'%{${fg[yellow]}%}[%n@%m]%{$reset_color%}%{${fg[white]}${bg[magenta]}%}[VISUAL]%{$reset_color%} %{${fg[blue]}%} %~ %{$reset_color%}\n%% '
            ;;
        *)
            PROMPT=$'%{${fg[yellow]}%}[%n@%m]%{$reset_color%}%{${fg[white]}${bg[green]}%}[${KEYMAP}]%{$reset_color%} %{${fg[blue]}%} %~ %{$reset_color%}\n%% '
            ;;
    esac
    LANG=en_US.UTF-8 vcs_info
    RPROMPT='%{${fg[green]}%}${vcs_info_msg_0_}%{$reset_color%}'
    zle reset-prompt
    zle -R -c
}

zle -N zle-keymap-select
zle -N zle-line-init
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
    selected=$(docker ps | sed 1d | fzf -m | awk '{print $1}')
    [ $(echo ${selected} | wc -w) -eq 0 ] && return
    docker stop $selected

    zle reset-prompt
    zle -R -c
}
drm() {
    selected=$(docker ps -a | sed 1d | fzf -m | awk '{print $1}')
    [ $(echo ${selected} | wc -w) -eq 0 ] && return
    docker rm -f $selected

    zle reset-prompt
    zle -R -c
}
drmi() {
    selected=$(docker images | sed 1d | fzf -m | awk '{print $3}')
    [ $(echo ${selected} | wc -w) -eq 0 ] && return
    docker rmi -f $selected

    zle reset-prompt
    zle -R -c
}
dsh() {
    selected=$(docker ps | sed 1d | fzf -m | awk '{print $1}')
    [ $(echo ${selected} | wc -w) -eq 0 ] && return
    docker exec -it $selected sh

    zle reset-prompt
    zle -R -c
}
dlogs() {
    selected=$(docker ps -a | sed 1d | fzf -m | awk '{print $1}')
    [ $(echo ${selected} | wc -w) -eq 0 ] && return
    docker logs $selected

    zle reset-prompt
    zle -R -c
}
checkout_gbranch() {
    # NOTE: サブディレクトリからでもcheckout可能にする
    #       プロジェクトルートにcdする制限付き（存在しないディレクトリに入ったりしないために
    tmpdir=$(pwd); branches=""
    while true ; do # NOTE: `$ git branch -a` を、cdしなくてもいい方法があればそちらのほうが良い
        if [ $(pwd) = "/" ]; then;
            cd ${tmpdir} && return 0
        fi

        if [ -d .git ]; then;
            branches=$(git branch -a)
            break
        else cd ../; fi
    done
    selected=$(echo ${branches} | awk 'BEGIN{}{print $1}' | grep -v 'HEAD' | grep -v '\*' | awk 'BEGIN{idx=1;FS="/"}{if($1=="remotes" && $2=="origin"){idx=3};for(i=idx;i<NF;i++){printf "%s/", $i}; print $NF}' | sort | uniq | fzf)
    # NOTE: プロジェクトルートからしかできない安定版は以下(上がぶっ壊れたらつかう)
    # [ ! -d .git ] && return 0
    # selected=`git branch -a | awk 'BEGIN{}{print $1}' | grep -v 'HEAD' | grep -v '\*' | awk 'BEGIN{idx=1;FS="/"}{if($1=="remotes" && $2=="origin"){idx=3};for(i=idx;i<NF;i++){printf "%s/", $i}; print $NF}' | sort | uniq | fzf`
    [ "${selected}" = "" ] && return 0
    git checkout ${selected}

    zle reset-prompt
    zle -R -c
}
put_gbranch() {
    # NOTE: checkout_gbranchと基本的に同じ問題を抱えてる
    tmpdir=$(pwd); branches=""
    while true ; do
        if [ $(pwd) = "/" ]; then;
            cd ${tmpdir} && return 0
        fi

        if [ -d .git ]; then;
            branches=$(git branch -a)
            break
        else cd ../; fi
    done
    selected=$(echo ${branches} | awk 'BEGIN{}{print $1}' | grep -v 'HEAD' | grep -v '\*' | awk 'BEGIN{idx=1;FS="/"}{if($1=="remotes" && $2=="origin"){idx=3};for(i=idx;i<NF;i++){printf "%s/", $i}; print $NF}' | sort | uniq | fzf)
    [ "${selected}" = "" ] && return 0
    LBUFFER+=${selected}
    CURSOR=$#LBUFFER
    cd ${tmpdir}

    zle reset-prompt
    zle -R -c
}
cd_ghq() {
    selected=$(for dir in $(ls $GHQPATH/github.com);do for dir2 in $(ls $GHQPATH/github.com/${dir});do echo ${dir}${dir2}; done; done | fzf)
    [ "${selected}" = "" ] && return 0
    cd $GHQPATH/github.com/${selected}

    zle reset-prompt
    zle -R -c
}
put_ghq() {
    selected=$(for dir in $(ls $GHQPATH/github.com);do for dir2 in $(ls $GHQPATH/github.com/${dir});do echo ${dir}${dir2}; done; done | fzf)
    [ "${selected}" = "" ] && return 0
    LBUFFER+=$GHQPATH/github.com/${selected}
    CURSOR=$#LBUFFER

    zle reset-prompt
    zle -R -c
}
cd_dirhist() {
    selected=$(dirs -pl | sort | uniq | awk 'BEGIN{FS=" "}{print $1}' | fzf)
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
# for k8s {{{
# change namespace
# for namespace
_selectns() {
    # if exit status is 0, return podname
    # or else, return err msg
    selected=$(kubectl get ns | fzf)
    [ "${selected}" = "" ] && echo "[ERROR] pod is not specified or press ESC" && return 1
    echo $(echo ${selected} | awk 'BEGIN{FS=" "}{print $1}END{}')
}
kchns() {
    ns=$(_selectns)
    [ "${ns}" = "" ] && echo "[ERROR] namespace is not specified" && return 1
    echo "kubectl config set-context \$(kubectl config current-context) --namespace=${ns}"
    kubectl config set-context $(kubectl config current-context) --namespace=${ns}
}
# for Pods
_selectpo() {
    # if exit status is 0, return podname
    # or else, return err msg
    selected=$(kubectl get pod | fzf)
    [ "${selected}" = "" ] && echo "[ERROR] pod is not specified or press ESC" && return 1
    echo $(echo ${selected} | awk 'BEGIN{FS=" "}{print $1}END{}')
}
ksh() {
    res=$(_selectpo)
    [ $? != 0 ] && echo ${res} && return 1
    echo "k exec -it " ${res} "sh"
    kubectl exec -it ${res} sh
}
kdesc() {
    res=$(_selectpo)
    [ $? != 0 ] && echo ${res} && return 1
    echo "k describe " ${res}
    kubectl describe pod ${res}
}
kpf() {
    res=$(_selectpo)
    [ $? != 0 ] && echo ${res} && return 1
    echo "k port-forward " ${res} ${1}
    kubectl port-forward ${res} ${1}
}
klogs() {
    res=$(_selectpo)
    [ $? != 0 ] && echo ${res} && return 1
    echo "k logs " ${res} ${1}
    kubectl logs ${res} ${1}
}
kpoll() {
    for i in $(seq 1 1000); do echo "[" $(date) "]"; kubectl get pod; sleep 1; done
}
krefresh() {
    kubectl delete -f ${1} && kubectl apply -f ${1}
}
# TODO: more and more...
# }}}
# some custom commands {{{
dusk() {
    # calc file and dir size in the current dir
    ls -al | sed 1d | awk '{for(i=9;i<NF;i++){printf("%s\ ", $i)};print($NF)}' | while read i; do du -sk $i; done | sort -n
}

cdg() {
    # NOTE:
    #   $ ghq get git@github.com/<USER_ID>/<REPOSITORY_NAME>.git      # using ssh (should NOT forget `.git`)
    #   or
    #   $ ghq get <USER_ID>/<REPOSITORY_NAME>                         # using https
    #
    #   should do this command after executed ghq command
    p=$(history | sort -n -r | awk '{ if($2=="ghq"){for(i=2;i<NF;i++){print $NF}} }' | head -n 1) \
        && if [ `echo $p | grep git@` ]; then
            cd $GHQPATH/github.com/$(echo $p | perl -pe 's/git\@github\.com:(.*?)\.git/$1/' | perl -pe 's/git\@github\.com:(.*?)/$1/')
        else
            cd $GHQPATH/github.com/$p
        fi
        unset p
}

dir() {
    mkdir $1 && cd $_
}

gg() {
    # NOTE: NEEDs chrome-cli
    #       $ brew install chrome-cli
    ghq get $(chrome-cli info | sed -n 's/Url: https:\/\/github.com\/\(.*\)/git@github.com:\1/p')
    cd $GHQPATH/$(echo $_ | sed -e 's/git\@github.com:\(.*\)/github.com\/\1/')
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
alias sss='exec $SHELL -l'
alias ls='ls -F'
alias la='ls -la'
alias rm='rm -i'
alias emacs='emacs -nw'
alias e='nvim'
alias k='kubectl'
alias t='terraform'

# docker
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dim='docker images'

# git
alias g='git'
alias ga='git add .'
alias gC='git commit'
alias gc='git checkout -b'
alias gs='git status'
alias gP='git push'
alias gp='git pull'
alias gd='git diff'

# stack
alias ghc='stack ghc'
alias ghci='stack ghci'
alias runghc='stack runghc'

# go
alias gocov='go test -cover'
alias gocovw='go test -coverprofile=cover.out && go tool cover -html=cover.out -o cover.html && open cover.html'

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

j() {
    javac $1 && java $(echo $_ | sed -e "s/\.java//g")
}
# }}}
# like vim {{{
:e() {
    nvim $@
}
:q() {
    exit
}
alias e=":e"
alias q=":q"
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

    # bindkey for Linux
    bindkey '^rx' brdown
    bindkey '^ra' brup
else
    echo "unnecessary brightness control functions"
fi

# coloring error output
# exec 2> >( read e; [ "${e}" != "" ] && $(echo ${e} | sed "s/^/${fg_bold[magenta]}/;s/$/${reset_color}/") )

# coloring for test
alias colorit="sed 's/PASS/${fg[green]}PASS${reset_color}/' | sed 's/FAIL/${fg[red]}FAIL${reset_color}/'"
alias -g CL="| colorit"

# jo
jp() {
    jo -p "${@}"
}
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
bindkey '^j' cd_ghq
bindkey '^[B' put_gbranch # alt-shift-b
bindkey '^[J' put_ghq # alt-shift-j

bindkey '^x' cd_dirhist

bindkey '^p' anyframe-widget-put-history
bindkey '^k' anyframe-widget-kill

bindkey '^ws' dstop
bindkey '^wr' drm
bindkey '^wi' drmi

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
if [ $(uname) = "Linux" ]; then
    alias chrome=chromium-browser
    export PATH=$HOME/.bin/DevDocs-0.6.9/:$PATH
fi
# }}}
# gcloud {{{
# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then source "$HOME/google-cloud-sdk/completion.zsh.inc"; fi
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
# }}}
# init env {{{
eval "$(pyenv init -)"
eval "$(rbenv init -)"
eval "$(ndenv init -)"
eval "$(goenv init -)"
# }}}
# COMPLETE! {{{
echo "complete!"
# }}}
