#/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
BGreen='\033[1;32m' # Color green
NC='\033[0m' # No Color
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo -e "${BGreen}# Installing extensions ...${NC}"
bash ${DIR}/extensions/install.sh

echo -e "${BGreen}# Installing fonts...${NC}"
bash ${DIR}/fonts/install.sh

echo -e "${BGreen}# Installing wallpapers${NC}"
bash ${DIR}/wallpaper/install.sh

echo -e "${BGreen}# Installing themes${NC}"
cd ${DIR}/themes/Orchis-theme
./install.sh -t all

echo -e "${BGreen}# Installing icons${NC}"
cd ${DIR}/themes/Tela-circle-icon-theme
./install.sh -a

echo -e "${BGreen}# Installing cursors${NC}"
cd ${DIR}/themes/Vimix-cursors
./install.sh

cd ~