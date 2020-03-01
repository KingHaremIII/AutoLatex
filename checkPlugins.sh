#!/bin/bash
# All required plugins are listed as follows. 
# Although some one is not necessary to create an AutoLatex, 
# we recommand you install all of the them for the best experience of leveraging this tool. 

# git
# echoc
# jdk1.8

echo ""
which "git" > /dev/null
if [ $? -eq 0 ]
then
	echo $(git --version)
else
    echo "git command not exist"
fi

echo ""
which "java" > /dev/null
if [ $? -eq 0 ]
then
	echo $(java -version)
else
    echo "java command not exist"
fi

echo ""
which "echoc.sh" > /dev/null
if [ $? -eq 0 ]
then
	echo $(echoc.sh --help)
else
    echo "echoc command not exist"
fi