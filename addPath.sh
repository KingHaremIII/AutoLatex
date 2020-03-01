#!/bin/bash
# Add path
file=$1
abPath=$(dirname $(readlink -f $0))
# backup the file
bkName=.bashrc$(date +%Y-%m-%d)
cp ${file} ~/.AutoLatexBackup/${bkName}
cat << EOF >> ${file}

# AutoLatex Configuration
export AutoLatex_HOME=${abPath}
export PATH=\${PATH}:\${AutoLatex_HOME}
EOF