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

source $HOME/env.zsh
source $HOME/.cargo/env

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
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux

zplug load --verbose
# }}}
# fzf {{{
function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history
# }}}
# alias {{{
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
# }}}
# export {{{
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

export XDG_CONFIG_HOME=$HOME/.config
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:
export GOPATH=$HOME/go
# export PATH=/usr/local/bin:$PATH
export PATH=$PATH:$GOPATH/bin
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=/usr/local/Cellar/git/2.12.2:$PATH
export PATH=${PATH}:${GOPATH}/bin
export PATH=$HOME/.protoc/bin:$PATH
export PATH=$PATH:/Users/noah/.nodebrew/current/bin
export PATH=$PATH:$HOME/.rbenv/versions/2.4.1/bin
export ZPLUG_HOME=$HOME/.zplug
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/shims:$PATH
source $ZPLUG_HOME/init.zsh
export PROMPT="%{${fg[cyan]}%}[%n@%m]%{${reset_color}%} %~
%# "
# }}}
# other {{{
setopt no_beep
setopt auto_cd
setopt correct
# }}}
