#!/bin/bash
# This is a script for creating a new project of academic article
nameProject=$1
path=$2
model=$3

if [ "${nameProject}" == "--help" ]
then
	echo "input the name of new project for first parameter and the path for the second parameter."
else
	if [[ "${path}" == "" ]]; then
		echoc.sh "error: path is needed!" red subline
	else
		fullPath=${path}/${nameProject}
		cd ${path}
		abPath=$(dirname $(readlink -f $0))
		mkdir ${nameProject}
		cd ${nameProject}
		# initialize git
		which "git" > /dev/null
		if [ $? -eq 0 ]
		then
		    git init
		    cp ${AutoLatex_HOME}/library/.gitignore .
		else
		    echo "git command not exist"
		    echoc.sh "Your PC may not install git so you need to control version by yourself or initialize git manually. " red
		fi

		if [[ "$model" == "" ]]; then
			touch Evn.xml
			touch Structure.xml
			touch README.md
			mkdir Document
			mkdir Target
			cd Target
			# pictures, tableTex and algorithmTex
			mkdir Resources
			touch ref.bib
		else
			# Copy the half-completed project from library
			cp ${AutoLatex_HOME}/library/${mdoel}.tar.gz .
			tar -zx ${model.tar.gz}
			rm ${model}.tar.gz
		fi

		# notice the user
		echo "Created a new project named"
		echoc.sh ${nameProject} red bold,flash
		echo "under the path: "
		echoc.sh ${fullPath} green subline
		if [[ "$model" != "" ]]; then
			echo "by the template of"
			echoc.sh ${model} brown bold
		fi

		# show structure
		cd ${abPath}
		tree ${nameProject}
	fi
fi
