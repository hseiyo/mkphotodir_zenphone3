#!/bin/bash

for f in [PV]_*
do
	date=${f#*_}
	date=${date%%_*}
	echo $f
	if [ -z ${date//[0-9]*/} ]
	then
		mkdir $date > /dev/null 2>&1
		mkdir ${date}/zenfone3 > /dev/null 2>&1
		mv $f ${date}/zenfone3
	fi
done
