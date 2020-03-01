#!/bin/bash
# run it before starting your AutoLatex tour. 

# set source file
file=.bashrc
path=~

abPath=$(dirname $(readlink -f $0))abPath=$(dirname $(readlink -f $0))
cd ${path}
# create backup directory
mkdir .AutoLatexBackup

check=$(cat ${path}/${file} | grep AutoLatex)
if [[ ${check} == "" ]]; then
	${abPath}/addPath.sh ${path}/${file}
else
	echoc.sh "Already set Path" red
	read -p "Reset?(y/n)" YorN
	if [[ ${YorN} == "y" ]]; then
		${abPath}/deletePath.sh ${path}/${file}
		${abPath}/addPath.sh ${path}/${file}
	fi
fi

source ${path}/${file}
cat -n ${path}/${file} | grep AutoLatex
cd ${abPath}