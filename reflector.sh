#!/bin/bash
# move to project directory
path=$1
if [[ -d ${path} ]]; then
	cd ${path}
	# Step 1: git for backup
	git add .
	git commit -m "autoGit_reflector_"$(date +%Y-%M-%D)
	git tag vAutoGit$(date +%Y-%M-%D) -m "This is a auto git by reflector"
	# Step 2: reflector
	java ReflectorEntry $(pwd)
	# Step 3: show current structure
	tree -c $path
else
	echoc.sh "Wrong Path, check your input. The parameter should be the absolute path of the project. " red subline
fi