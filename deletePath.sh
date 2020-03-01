#!/bin/bash
# delete AutoLatex path for re-configuration
file=$1
# start=${cat ${file} | grep "# AutoLatex Configuration"}
# end=${number}+2
# sed -i "${start},${end}d" $file
sed -i "/AutoLatex/d" ${file}