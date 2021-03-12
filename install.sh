#!/bin/bash

# Define global vars
export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
export COLOR_NORMAL='\033[0m'
export COLOR_BOLD='\033[1m'
export COLOR_GREEN='\033[1;32m'
export COLOR_RED='\033[1;31m'

# ensure run as root
if [ "$EUID" -ne 0 ]
  then echo -e "${COLOR_RED}Script need to be run as root${COLOR_NORMAL}"
  exit
fi

# Import functions
. ${DIR}/bin/spinner
. ${DIR}/bin/config

# User inputs
read -p "Enter hostname: " HOSTNAME_INSTALL
read -p "Unix user to add: " USER_INSTALL
read -sp "Unix user password: " USER_PWD
read -sp $'\nRetype password: ' USER_PWD_VERIF

if [[ "$USER_PWD" != "$USER_PWD_VERIF" ]]
  then echo -e "${COLOR_RED}\nPassword verification: retype password is not the same${COLOR_NORMAL}"
  exit
fi

read -sp $'\nRoot user password: ' ROOT_PWD
read -sp $'\nRetype password: ' ROOT_PWD_VERIF

if [[ "$ROOT_PWD" != "$ROOT_PWD_VERIF" ]]
  then echo -e "${COLOR_RED}\nPassword verification: retype password is not the same${COLOR_NORMAL}"
  exit
fi

export HOSTNAME_INSTALL
export USER_INSTALL
export USER_PWD
export USER_PWD_VERIF
export ROOT_PWD
export ROOT_PWD_VERIF

printf "${COLOR_BOLD}\n# Updating packages${COLOR_NORMAL}\t"
# spinner pacman -Syu --noconfirm

printf "${COLOR_BOLD}# Installing packages${COLOR_NORMAL}\t"
spinner sleep 1
# spinner pacman -S --noconfirm vim sudo grub efibootmgr dosfstools os-prober mtools networkmanager base-devel xorg xorg-server gdm gnome-terminal gnome-control-center gnome-tweak-tool gnome-keyring gnome-shell chrome-gnome-shell nautilus gnome-menus xdg-utils xdg-user-dirs-gtk jq curl gtk-engine-murrine sassc

printf "${COLOR_BOLD}# Configure locales${COLOR_NORMAL}\t"
spinner sleep 1
# spinner configure_locales

printf "${COLOR_BOLD}# Configure host${COLOR_NORMAL}\t"
spinner sleep 1
# spinner configure_host

printf "${COLOR_BOLD}# Configure users${COLOR_NORMAL}\t"
spinner sleep 1
# spinner configure_users

printf "${COLOR_BOLD}# Configure boot${COLOR_NORMAL}\t"
spinner sleep 1
# spinner configure_boot

printf "${COLOR_BOLD}# Enable services${COLOR_NORMAL}\t"
spinner sleep 1
# spinner enable_services

printf "\n\n\t${COLOR_GREEN}INSTALLATION DONE${COLOR_NORMAL}\n\n"