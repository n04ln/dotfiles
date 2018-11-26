#!/bin/sh

_mv_config_file() {
    # NOTE:
    #   $1: the config file name
    #   $2: the path of the src file
    #   $3: the path of the dst file
    #   $4: force replace flag (`-f`)
    _check() {
        # NOTE:
        #   $1: string
        #   $2: force replace flag (`-f`)
        if [ "${2}" == "-f" ]; then return 1; fi
        /bin/echo -n ${1}
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

# MOVE CONFIG FILES
# .vimrc
_mv_config_file .vimrc vim/.vimrc $HOME/.vimrc force
# .ideavimrc force
_mv_config_file .ideavimrc vim/.ideavimrc $HOME/.ideavimrc force
# .tmux.conf_bk force
_mv_config_file .tmux_conf tmux/.tmux.conf $HOME/.tmux.conf force
# .config/nvim force
_mv_config_file .config/nvim .config/nvim $HOME/.config/nvim force
# .config/karabiner force
_mv_config_file .config/karabiner .config/karabiner $HOME/.config/karabiner force
