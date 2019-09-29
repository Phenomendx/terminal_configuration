#!/bin/bash

# AIM OF THIS SCRIPT IS TO SPEED UP PERSONAL WORKFLOW
#
# SHORCUT OF THE FOLLOWING ACTIONS
#				 1. GIT ADD
# 			 2. GIT COMMIT
#				 3. GIT PUSH
#
# HOW TO USE ?
# 			$ gapp the_file commit_message 
#				$ gapp th_directory commit_message

case "$1" in 
	"") echo "Usage: ${0##*/} <filename>"; exit $E_PARAM;;
	-*) FILENAME=./$1;;
	* ) FILENAME=$1;;
esac

[ ! -f $FILENAME ] && [ ! -d $FILENAME ] && echo "Not a file or directory" && exit

git add $FILENAME

git commit $FILENAME -m"$2"

git push $FILENAME

echo "Done add commit and push"
