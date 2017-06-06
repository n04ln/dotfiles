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

export ZPLUG_HOME=~/.zplug
export XDG_CONFIG_HOME=$HOME/.config
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/go/bin:$GOPATH/bin
export PATH=$HOME/.pyenv/shims:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=/usr/local/Cellar/go/1.8/bin:$PATH
export PROMPT="%{${fg[cyan]}%}[%n@%m]%{${reset_color}%} %~
%# "

HISTFILE=$HOME/.zsh/.zsh_histry
HISTSIZE=1000000
SAVEHIST=1000000
setopt extended_history

if which pyenv 2>&1 >/dev/null; then alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"; fi

alias g='git'
alias ls='ls -F'
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


### Added by the Bluemix CLI
source /usr/local/Bluemix/bx/zsh_autocomplete
