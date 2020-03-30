#! /bin/bash

set -eux 

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

msg="Update  `date`"
if [ $# -eq 1  ]
    then msg="$1"
fi

# Go To website-themes/blog folder
cd ./blog

# Build the project. 
hugo      # if using a theme, replace by `hugo -t <yourtheme>`

# Go To website-themes/blog folder
cd ../usv.netlify.com

# Build the project. 
hugo      # if using a theme, replace by `hugo -t <yourtheme>`

# Go To Public folder
cd ../../wesvi.github.io

# Add changes to git.
git add .

# Commit changes.
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come content
cd ../content

git add .
git commit -m "$msg"
git push origin master

# Come website
cd ../website
git add .
git commit -m "$msg"
git push origin master

# Come websit-themes
cd ../website-themes

git add .
git commit -m "$msg"
git push origin master
