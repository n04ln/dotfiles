#!/bin/bash -eux

zsh ./setup.zsh -cf
[ "$(exec $(which zsh) -l > /dev/null)" != "" ] && return 1 || return 0
nvim -c PlugInstall -c PlugUpdate -c "redir > nvim_errmsg" -c messages -c "redir END" -c qa!
[ "$(cat nvim_errmsg)" != "" ] && cat nvim_errmsg && return 1 || return 0

