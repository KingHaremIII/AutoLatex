#!/bin/bash
# run it before starting your AutoLatex tour. 

# set source file
file=.bashrc
path=~

which "echoc.sh" > /dev/null
if [ $? -eq 0 ]
then
	echoc.sh "Your PC already installed echoc" green bold
else
    tar -zxvf echoc.tar.gz -C ./bin/echoc.sh
    tar -zxvf echoc.tar.gz
fi

abPath=$(dirname $(readlink -f $0))
echo ${abPath}
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
