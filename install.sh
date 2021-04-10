#!/bin/bash

# Define global vars
export INSTALL_LANG='fr_FR.UTF-8'
export INSTALL_ENC='UTF-8'
export KBD_MAP='fr-latin1'
export KBD_LAYOUT='fr'
export KBD_VAR='azerty'
export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
export LOG_FILE=$DIR/install.log
export LOG_PKG_FILE=$DIR/install.packages.log
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

# Root profile
cp -f ${DIR}/config/.bashrc ~/.bashrc
source ~/.bashrc

# Start installation
clear

printf "\n\n\t${COLOR_BOLD}INSTALLATION START${COLOR_NORMAL}\n\n"

printf "${COLOR_BOLD}\n# Updating packages${COLOR_NORMAL}\t"
spinner update

printf "${COLOR_BOLD}# Installing packages${COLOR_NORMAL}\t"
spinner install

printf "${COLOR_BOLD}# Configure host${COLOR_NORMAL}\t"
spinner configure_host

printf "${COLOR_BOLD}# Configure users${COLOR_NORMAL}\t"
spinner configure_users

printf "${COLOR_BOLD}# Configure locales${COLOR_NORMAL}\t"
spinner configure_locales

printf "${COLOR_BOLD}# Configure boot${COLOR_NORMAL}\t"
spinner configure_boot

printf "${COLOR_BOLD}# Configure Desktop${COLOR_NORMAL}\t"
spinner configure_desktop

#printf "${COLOR_BOLD}# Configure Extensions${COLOR_NORMAL}\t"
#spinner configure_extensions

printf "${COLOR_BOLD}# Configure Settings${COLOR_NORMAL}\t"
spinner configure_settings

printf "${COLOR_BOLD}# Enable services${COLOR_NORMAL}\t"
spinner enable_services

printf "\n\n\t${COLOR_GREEN}INSTALLATION DONE${COLOR_NORMAL}\n\n"