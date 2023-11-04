#!/bin/bash


current=$(git branch | grep "*" | cut -b 3-)

message=\'"$@"\'

git add -A && git commit -a -m "$message"

echo "wherer to push"
read -i "$current" -e branch

echo "You sure you wanna push?(Y/N)"
read -i "y" -e yn

if [ "$yn" == y ]; then
	git push origin "$branch"
else
	echo "Have a nice day"
fi


