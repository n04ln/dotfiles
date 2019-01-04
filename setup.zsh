#!/bin/zsh

local -A opts
zparseopts -D -A opts -help h -force f

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

_show_help() {
    echo "setup.zsh is the Installer of NoahOrberg's dotfiles"
    echo "It setup .vimrc, .ideavimrc, .tmux.conf, init.vim(for neovim) and karabiner config file"
    echo ""
    echo "Options:"
    echo "  -f, --force ... force replacement"
    echo "  -h, --help  ... show this message"
    exit 0
}

# show help
[[ -n "${opts[(i)--help]}" ]] && _show_help
[[ -n "${opts[(i)-h]}" ]] && _show_help

# MOVE CONFIG FILES
# .zshrc
_mv_config_file .zshrc zsh/.zshrc $HOME/.zshrc
# .vimrc
_mv_config_file .vimrc vim/.vimrc $HOME/.vimrc
# .ideavimrc
_mv_config_file .ideavimrc vim/.ideavimrc $HOME/.ideavimrc
# .tmux.conf_bk
_mv_config_file .tmux_conf tmux/.tmux.conf $HOME/.tmux.conf
# .config/nvim
_mv_config_file .config/nvim .config/nvim $HOME/.config/nvim
# .config/karabiner
_mv_config_file .config/karabiner .config/karabiner $HOME/.config/karabiner
