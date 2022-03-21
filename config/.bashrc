#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Default prompts
PS1=$'[\u@\h]-[\w] \$ '


# Exports
export LC_ALL=#INSTALL_LANG
export LANG=#INSTALL_LANG
export LANGUAGE=#INSTALL_LANG

# Aliases
alias ls='lsd'
alias ll='lsd -lA --group-dirs first'
alias gs="git status -sbu"
alias gb="git branch -a"
alias gp="git push -u origin HEAD"
alias gl=$'git log --pretty=format:"%C(yellow)%h - %ad%Cred%d - %Creset%s%Cblue - [%cn]" --decorate --date=format:\'%d/%m/%Y %H:%M\' --graph'