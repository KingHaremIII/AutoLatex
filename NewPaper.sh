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
		mkdir ${nameProject}
		cd ${nameProject}

		if [[ "$model" == "" ]]; then
			echoc.sh "Creating a new AutoLatex project..." purple bold
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
			echoc.sh "Creating a AutoLatex project from library..." purple bold
			# Copy the half-completed project from library
			libraryPath=${AutoLatex_HOME}/library
			templatePath=${libraryPath}/${model}.tar.gz
			echo ${templatePath}
			cp ${templatePath} ${fullPath}
			tar -zxvf ${model}.tar.gz
			rm ${model}.tar.gz
		fi

		# initialize git
		which "git" > /dev/null
		if [ $? -eq 0 ]
		then
			cd ${fullPath}
		    git init
		    cp ${AutoLatex_HOME}/library/.gitignore .
		    git add .
		    git commit -m "Started a new AutoLatex project"
		else
		    echo "git command not exist"
		    echoc.sh "Your PC may not install git so you need to control version by yourself or initialize git manually. " red
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
		tree ${fullPath}
	fi
fi
