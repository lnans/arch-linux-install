#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Colors test
function test_color() {
    local T=$'\u25cf\u25cf\u25cf'   # The test text

    echo -e "\n                 40m     41m     42m     43m\
        44m     45m     46m     47m";

    for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
            '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
            '  36m' '1;36m' '  37m' '1;37m';
    do FG=${FGs// /}
    echo -en " $FGs \033[$FG  $T  "
    for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
        do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
    done
    echo;
    done
    echo
}

# Display vars
PWD_INFO="\033[30m\033[44m\uE0B0 \033[30m"
ARROW_START_PWD="\033[30m\033[44m\uE0B0 "
ARROW_END_PWD="\033[m\033[34m\uE0B0\033[0m"
ARROW_END_GIT="\033[m\033[32m\uE0B0\033[0m \033[m"
ARROW_START_GIT="\033[42m\033[34m\uE0B0\033[30m \uE0A0 "
NEW_LINE="\n"
PROMP_SIGN="\u276F "

function display_prompt() {
    # Determine user type
    USER_INFO="\033[30m\uE0B6\033[1;37m\033[40m$(whoami)@$HOSTNAME \033[m"
    ROOT_INFO="\033[30m\uE0B6\033[1;31m\033[40m\u2b1F root\033[1;37m@$HOSTNAME \033[m"
    if [ "$EUID" -ne 0 ]
    then
        HOST_INFO=$USER_INFO
    else
        HOST_INFO=$ROOT_INFO
    fi

    # Determine git status
    BRANCH=""
    BRANCH=$(git branch --show-current 2> /dev/null)
    DIR="$(dirs +0)"
    RES_PROMPT="${HOST_INFO}${PWD_INFO}${DIR} "

    if [ "$BRANCH" = "" ]
    then
        RES_PROMPT="${RES_PROMPT}${ARROW_END_PWD}"
    else
        RES_PROMPT="${RES_PROMPT}${ARROW_START_GIT}${BRANCH} ${ARROW_END_GIT}"
    fi

    # Display prompt
    echo -en "${RES_PROMPT}${NEW_LINE}${PROMP_SIGN}"
}

if [ "$TERM_NAME" = "Alacritty" ]
then
    # Prompt for Alacritty
    PS1=$'$(display_prompt)'
else
    # Default prompts
    PS1=$'[\u@\h]-[\w] \$ '
fi

# Exports
export LC_ALL=fr_FR.UTF-8
export LANG=fr_FR.UTF-8
export LANGUAGE=fr_FR.UTF-8

# Aliases
alias ls='ls -lGAvFh --color=auto --group-directories-first'
alias ll='ls -lGAvFh --color=auto --group-directories-first'
alias gs="git status -sb"
alias gl=$'git log --pretty=format:"%C(yellow)%h - %ad%Cred%d - %Creset%s%Cblue - [%cn]" --decorate --date=format:\'%d/%m/%Y %H:%M\' --graph'