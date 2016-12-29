fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit
compinit 
autoload _U promptinit
promptinit
export LANG=ja_JP.UTF-8
autoload -Uz colors
colors

bindkey "^N" menu-complete

export XDG_CONFIG_HOME=$HOME/.config
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:

export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:/Users/reo/git/sccp2016_first_semester_final/src:$HOME/.rbenv/shims:$HOME/.local/bin:$PATH"
export PATH="/usr/local/Cellar/postgresql/9.6.1/bin:$PATH"
export PATH="$HOME/.pyenv/shims:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PROMPT="%{${fg[cyan]}%}[%n@%m]%{${reset_color}%} %~
%# "
#------
HISTFILE=$HOME/.zsh/.zsh_histry
HISTSIZE=1000000
SAVEHIST=1000000
setopt extended_history
#------

alias ls='ls -F'
alias rm='rm -i'
alias emacs='emacs -nw'
alias vim='nvim'
alias vi='nvim'
alias ssha='ssh u-aizu -X'
# alias js='osascript -l JavaScript'
alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc'
# alias ghc='stack ghc'
# alias ghci='stack ghci'
# alias runghc='stack runghc'
alias -g B='|bash' 
alias -g C='|pbcopy' # output -> clipboard
alias -g G='|grep -e' # output -> grep
alias -g L='|less' # output -> less
alias -g W='|wc' # output -> wc

setopt no_beep
setopt auto_cd
setopt correct

