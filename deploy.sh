#! /bin/bash

set -eux 

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

msg="Update  `date`"
if [ $# -eq 1  ]
    then msg="$1"
fi

git add .
git commit -m "$msg"
git push -u origin master
