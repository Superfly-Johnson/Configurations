!/bin/sh
if [[ -d "$HOME/.bashrc.d" ]]
then
  echo "$HOME/.bashrc.d doesn't exist. Creating it..."
  mkdir "$HOME/.bashrc.d"
fi
