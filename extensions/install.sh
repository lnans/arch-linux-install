#bin/bash

USER=${1}
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
FILES=${DIR}/*.zip
for file in $FILES
do
  UUID=$(unzip -c $file metadata.json | grep uuid | cut -d \" -f4)
  mkdir -p /home/${USER}/.local/share/gnome-shell/extensions/${UUID}
  unzip -q ${file} -d ~/.local/share/gnome-shell/extensions/${UUID}/
  chown -R ${USER}:${USER} /home/${USER}/.local
done
