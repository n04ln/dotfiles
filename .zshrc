export LANG=ja_JP.UTF-8
autoload -Uz colors
colors

PROMPT="%{${fg[cyan]}%}[%n@%m]%{${reset_color}%} %~
%# "
#------
HISTFILE=$HOME/.zsh/.zsh_histry
HISTSIZE=1000000
SAVEHIST=1000000
setopt extended_history
#------

alias ls='ls -F'
alias rm='rm -i'
alias -g C='|pbcopy' # output -> clipboard
alias -g G='|grep -e' # output -> grep
alias -g L='|less' # output -> less
alias -g W='|wc' # output -> wc

setopt no_beep
setopt auto_cd

