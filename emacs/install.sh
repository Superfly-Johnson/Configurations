#!/bin/sh
EMACSDIR="$HOME/.emacs.d"
if [ ! -d ${EMACSDIR} ]
then
  echo "${EMACSDIR} doesn't exist. Creating it..."
  mkdir ${EMACSDIR}
fi
for f in init.el config.org; 
  do echo "Symlinkg ${f} to ${EMACSDIR}/${f}";
  ln -sf $(readlink -f ${f}) $EMACSDIR/${f};
done
