#!/bin/bash

INSTALLDIR=~/bin


TARGETDIR=$(cd $(dirname $0) && pwd)
DESTDIR=$(cd $INSTALLDIR && pwd)
INSTALLFILE=${TARGETDIR}/install_files
CURDIR=$(pwd)
LINKDIR=${TARGETDIR//$DESTDIR\//}

cd ${TARGETDIR}

if [ ! -r ${INSTALLFILE} ]
then
	echo "ERROR: can't read install_files: ${TARGETDIR}/install_files"
fi

while read TF
do
	chmod 755 ${TF}

	if [ -e ${DESTDIR}/${TF} ]
	then
		echo "ERROR: already exists: ${TF}"
		exit 1
	fi
	
	( cd ${DESTDIR} && ln -s ${LINKDIR}/${TF} . )

done < ${INSTALLFILE}

cd ${CURDIR}

