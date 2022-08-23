#!/bin/sh
PROFILEDIR="$HOME/.profile.d"
  for i in *.nix; do
    echo "Copying $i to $HOME/.config/nixpkgs/$i"
    cp ${i} "$HOME/.config/nixpkgs/$i"
    echo "Switching Home-Manager's configuration..."
    home-manager switch
  done
  if [ ! -d ${PROFILEDIR} ]
  then
    echo "${PROFILEDIR} doesn't exist. Creating it..."
    mkdir ${PROFILEDIR}
  fi
  echo "Copying env-vars.sh to $PROFILEDIR..."
  cp "./env-vars.sh" $PROFILEDIR
  if ! grep -e "for i in \$HOME\/\.profile\.d" $HOME/.profile ; then
    echo 'Sourcing of files in $HOME/.profile.d/ is not set. Setting it...'
    echo '# Sourcing files under $HOME/.profile.d/
for i in $HOME/.profile.d/*; do
    source $i
done' >> $HOME/.profile
  fi
