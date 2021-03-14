#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lasFH --color=auto'
alias gs="git status -sb"
alias gl='git log --oneline --all --graph --decorate'

PS1='[\u@\h \W]\$ '

export LC_ALL=fr_FR.UTF-8
export LANG=fr_FR.UTF-8
export LANGUAGE=fr_FR.UTF-8
