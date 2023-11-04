#!/bin/bash

upstream="upstream"
branch_to_sync="main"

if git remote | grep -q $upstream; then
	echo "upstream 已存在"
else
	echo "不存在"
	read -p "輸入同步的專案路徑: " project_name
	git remote add $upstream $project_name
fi

echo "---fetch $upstream---"
git fetch $upstream 

git checkout $branch_to_sync

echo "---merge $upstream---"
git merge $upstream/main

#git pull $upstream $branch_to_sync

git push origin $branch_to_sync

echo "fork already sync"
