fpath=(/usr/local/share/zsh-completions $fpath)
bindkey -v
autoload -U compinit
compinit 
autoload _U promptinit
promptinit
export LANG=ja_JP.UTF-8
autoload -Uz colors
colors

bindkey "^N" menu-complete
export LC_ALL='ja_JP.UTF-8'

export ZPLUG_HOME=~/.zplug
export XDG_CONFIG_HOME=$HOME/.config
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=/usr/local/Cellar/git/2.12.2:$PATH
export PATH=${PATH}:${GOPATH}/bin
export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh
export PROMPT="%{${fg[cyan]}%}[%n@%m]%{${reset_color}%} %~
%# "

<<<<<<< HEAD
=======
HISTFILE=$HOME/.zsh/.zsh_histry
HISTSIZE=1000000
SAVEHIST=1000000
setopt extended_history

if which pyenv 2>&1 >/dev/null; then alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"; fi

alias g='git'
>>>>>>> 145b9e049325ff729a48eb15d8262c1fbf2ed292
alias ls='ls -F'
alias la='ls -la'
alias rm='rm -i'
alias emacs='emacs -nw'
# alias ghc='stack ghc'
# alias ghci='stack ghci'
# alias runghc='stack runghc'
alias -g B='|bash' 
alias -g C='|pbcopy'
alias -g G='|grep -e'
alias -g L='|less'
alias -g W='|wc'

setopt no_beep
setopt auto_cd
setopt correct

<<<<<<< HEAD
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "wbinglee/zsh-wakatime"

# syntax
zplug "chrissicool/zsh-256color"
zplug "Tarrasch/zsh-colors"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "ascii-soup/zsh-url-highlighter"

# program
zplug "voronkovich/mysql.plugin.zsh"

# tools
zplug "marzocchi/zsh-notify"
# zplug "oknowton/zsh-dwim"

zplug load --verbose
=======

### Added by the Bluemix CLI
source /usr/local/Bluemix/bx/zsh_autocomplete
>>>>>>> 145b9e049325ff729a48eb15d8262c1fbf2ed292
