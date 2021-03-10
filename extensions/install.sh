DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
FILES=${DIR}/*.zip
for file in $FILES
do
  UUID=$(unzip -c $file metadata.json | grep uuid | cut -d \" -f4)
  mkdir -p ~/.local/share/gnome-shell/extensions/${UUID}
  unzip -q ${DIR}/${file} -d ~/.local/share/gnome-shell/extensions/${UUID}/

  gnome-shell-extension-tool -e $UUID
done
