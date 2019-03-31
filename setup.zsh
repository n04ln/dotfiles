#!/bin/zsh

local -A opts
zparseopts -D -A opts -help h -force f -diff d

# file location in dotfiles repository
zshrc_path=zsh/.zshrc
vimrc_path=vim/.vimrc
ideavimrc_path=vim/.ideavimrc
tmux_conf_path=tmux/.tmux.conf
nvim_config_path=.config/nvim
karabiner_config_path=.config/karabiner

# sub-functions for replace dotfiles
_mv_config_file() {
    # NOTE:
    #   $1: the config file name
    #   $2: the path of the src file
    #   $3: the path of the dst file

    _check() {
        # NOTE:
        #   $1: message
        [[ -n "${opts[(i)--force]}" ]] && return 1
        [[ -n "${opts[(i)-f]}" ]] && return 1

        # show message
        /bin/echo -n ${1}

        # input `y` or `n`
        read yn
        case "${yn}" in
            [Yy] )
                return 1 # execute: value is false
                ;;
            *)
                return 0 # abort: value is true
        esac
    }

    _copy() {
        if [ -d ${2} ]; then
            cp -r ${2}/* ${3} && echo "copy ${2}/* to ${3}\ncomplete ${1}"
        else
            cp -r ${2} ${3} && echo "copy ${2} to ${3}\ncomplete ${1}"
        fi
    }

    _mkdir() {
            mkdir -p ${1} && echo "No such directory: ${1}\nTherefore make ${1} directory"
    }

    if [ -e ${3} ]; then
        if _check "${3} is exists, Do u replace it? [Y/n]: " ${4}; then
            echo "skip ${1}"
        else
            _copy ${1} ${2} ${3}
        fi
    else
        fp=`echo ${3} | tr '/' '\n' | sed '$d' | tr '\n' '/'`
        if [ ! -e fp ]; then
            _mkdir ${fp}
        fi
        _copy ${1} ${2} ${3}
    fi
}

#_show_help: show help message
_show_help() {
    echo "setup.zsh is the Installer of NoahOrberg's dotfiles"
    echo "It setup .vimrc, .ideavimrc, .tmux.conf, init.vim(for neovim) and karabiner config file"
    echo ""
    echo "Options:"
    echo "  -f, --force ... force replacement"
    echo "  -h, --help  ... show this message"
    echo "  -d, --diff  ... save the difference(patch file) of each dotfiles to diff/"
    exit 0
}

# _diff: use diff command and redirect this output to diff/*
_diff() {
    if [ ! -e ./diff ] && mkdir -p diff/
    echo "make diff files to diff/*..."
    diff -up ${HOME}/.zshrc ${zshrc_path} > diff/zshrc.patch
    diff -up ${HOME}/.vimrc ${vimrc_path} > diff/.vimrc.patch
    diff -up ${HOME}/.ideavimrc ${ideavimrc_path} > diff/ideavimrc.patch
    diff -up ${HOME}/.tmux.conf ${tmux_conf_path} > diff/tmux.conf.patch
    diff -up ${HOME}/.config/nvim ${nvim_config_path} > diff/nvim.patch
    diff -up ${HOME}/.config/karabiner ${karabiner_config_path} > diff/karabiner.patch
    echo "done!"
    exit 0
}

# show help
[[ -n "${opts[(i)--help]}" ]] && _show_help
[[ -n "${opts[(i)-h]}" ]] && _show_help

# save diff files to diff/
[[ -n "${opts[(i)--diff]}" ]] && _diff
[[ -n "${opts[(i)-d]}" ]] && _diff

# if option is not specified or select `-f` option, move config files
_mv_config_file .zshrc ${zshrc_path} ${HOME}/.zshrc
_mv_config_file .vimrc ${vimrc_path} ${HOME}/.vimrc
_mv_config_file .ideavimrc ${ideavimrc_path} ${HOME}/.ideavimrc
_mv_config_file .tmux_conf ${tmux_conf_path} ${HOME}/.tmux.conf
_mv_config_file .config/nvim ${nvim_config_path} ${HOME}/.config/nvim
_mv_config_file .config/karabiner ${karabiner_config_path} ${HOME}/.config/karabiner
