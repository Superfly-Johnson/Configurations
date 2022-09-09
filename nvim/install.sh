#!/bin/sh
NVIMDIR="$HOME/.config/nvim"
if [ ! -d ${NVIMDIR} ]
then
  echo "${NVIMDIR} doesn't exist. Creating it..."
  mkdir ${NVIMDIR}
fi
echo "Symlinking init.vim to ${NVIMDIR}/${f}";
ln -sf $(readlink -f init.vim) $NVIMDIR/${f};
