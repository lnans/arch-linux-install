DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo '# Installing extensions ...'
.${DIR}/extensions/install.sh

echo '# Installing fonts...'
.${DIR}/fonts/install.sh

echo '# Installing wallpapers'
.${DIR}/wallpapers/install.sh

echo '# Installing themes'
.${DIR}/themes/Orchis-theme/install.sh -t all
.${DIR}/themes/Tela-circle-icon-theme/install.sh -a
.${DIR}/themes/Vimix-cursors/install.sh