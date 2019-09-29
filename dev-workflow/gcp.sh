#!/bin/bash

# AIM OF THIS SCRIPT IS TO SPEED UP PERSONAL WORKFLOW
#
# SHORCUT OF THE FOLLOWING ACTIONS
# 			 1. GIT COMMIT
#				 2. GIT PUSH
#
# HOW TO USE ?
# 			$ gcp the_repo_path commit_message 
#				$ gcp the_repo_path commit_message

case "$1" in 
	-*) FILENAME=./$1;;
	* ) FILENAME=$1;;
esac

git commit $FILENAME -m"$2"

git push $FILENAME

echo "Done commit and push"
