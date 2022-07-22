#!/bin/sh
EMACSDIR="$HOME/.emacs.d"
if [ ! -d ${EMACSDIR} ]
then
  echo "${EMACSDIR} doesn't exist. Creating it..."
  mkdir ${EMACSDIR}
fi
for f in init.el config.org; 
  do echo "Copying ${f} to ${EMACSDIR}/${f}";
  cp -pf ${f} $EMACSDIR/${f};
done
