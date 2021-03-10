DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo '# Installing extensions ...'
bash ${DIR}/extensions/install.sh

echo '# Installing fonts...'
bash ${DIR}/fonts/install.sh

echo '# Installing wallpapers'
bash ${DIR}/wallpapers/install.sh

echo '# Installing themes'
cd ${DIR}/themes/Orchis-theme
./install.sh -t all

cd ${DIR}/themes/Tela-circle-icon-theme
./install.sh -a

cd ${DIR}/themes/Vimix-cursors
./install.sh

cd ~