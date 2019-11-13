#!/bin/zsh

local -A opts
zparseopts -D -A opts -help h -force f -diff d -curl c

# file location in dotfiles repository
zshrc_path=zsh/.zshrc
vimrc_path=vim/.vimrc
ideavimrc_path=vim/.ideavimrc
tmux_conf_path=tmux/.tmux.conf
nvim_config_path=.config/nvim/init.vim
karabiner_config_path=.config/karabiner/karabiner.json
karabiner_for_thinkpad_keyboard_config_path=.config/karabiner/assets/complex_modifications/middle.json

# for using cURL
http_prefix=https://raw.githubusercontent.com/NoahOrberg/dotfiles/master/

# sub-functions for replace dotfiles
_mv_config_file() {
    # NOTE:
    #   $1: the config file name
    #   $2: the path of the src file
    #   $3: the path of the dst file

    _with_curl() {
        [[ -n "${opts[(i)--curl]}" ]] && return 0
        [[ -n "${opts[(i)-c]}" ]] && return 0
        return 1
    }

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
        cp -r ${2} ${3} && echo "copy ${2} to ${3}\ncomplete ${1}"
    }

    _curl_with_copy() {
        [ ! -e $(dirname ${3}) ] && mkdir -p $(dirname ${3})
        curl ${http_prefix}${2} -o ${3} && echo "cURL ${2}/* to ${3}\ncomplete ${1}"
    }

    _mkdir() {
        mkdir -p ${1} && echo "No such directory: ${1}\nTherefore make ${1} directory"
    }

    _run() {
        if _with_curl; then
            if [ -e ${3} ]; then
                if _check "${3} is exists, Do u replace it? [Y/n]: " ${4}; then
                    echo "skip ${1}"
                else
                    _curl_with_copy ${1} ${2} ${3}
                fi
            else
                fp=`echo ${3} | tr '/' '\n' | sed '$d' | tr '\n' '/'`
                if [ ! -e fp ]; then
                    _mkdir ${fp}
                fi
                _curl_with_copy ${1} ${2} ${3}
            fi
        else
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
        fi
    }

    # Execute!!
    _run ${1} ${2} ${3}
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
    echo "  -c, --curl  ... replace from GitHub"
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
    diff -up ${HOME}/.config/nvim/init.vim ${nvim_config_path} > diff/nvim.patch
    diff -up ${HOME}/.config/karabiner/karabiner.json ${karabiner_config_path} > diff/karabiner.patch
    diff -up $HOME/.config/karabiner/assets/complex_modifications/middle.json ${karabiner_for_thinkpad_keyboard_config_path} > diff/karabiner_for_thinkpad.patch
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
# if option is not specified or select `-c` option, each files are downloaded using cURL
_mv_config_file .zshrc ${zshrc_path} ${HOME}/.zshrc
_mv_config_file .vimrc ${vimrc_path} ${HOME}/.vimrc
_mv_config_file .ideavimrc ${ideavimrc_path} ${HOME}/.ideavimrc
_mv_config_file .tmux_conf ${tmux_conf_path} ${HOME}/.tmux.conf
_mv_config_file init.vim ${nvim_config_path} ${HOME}/.config/nvim/init.vim
_mv_config_file karabiner ${karabiner_config_path} ${HOME}/.config/karabiner/karabiner.json
_mv_config_file karabiner ${karabiner_for_thinkpad_keyboard_config_path} ${HOME}/.config/karabiner/assets/complex_modifications/middle.json
