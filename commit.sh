#!/bin/bash

message=\'"$@"\'
echo "$1"

if git rev-parse --verify $1; then
	git checkout $1
	git add -A
	git commit -a -m "$message"
	echo "add and commit finish"
else 
	echo "Not found this branch"
	echo "Do you want to create new branch $1 ?(Y/N)"};
	read -i "y" -e yn
	if [ "$yn" == y ]; then
		git checkout -b $1
		echo "Finish..."
		git commit -a -m "$message"
		echo "add and commit finish"
	else
		echo "Bye"
	fi
fi
