DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
sudo mkdir /usr/share/fonts/external
sudo cp ${DIR}/*.ttf /usr/share/fonts/external