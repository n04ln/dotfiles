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
bindkey -M viins 'jj' vi-cmd-mode
export LC_ALL='ja_JP.UTF-8'

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
