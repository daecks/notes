#!/bin/bash
clear
# echo 'Clean Cache...'
# hexo clean
# echo 'Clean...Done!'
# echo ''

echo 'Building Static Files...'
hexo g
echo 'Building...Done!'
echo ''

echo "Pulling Updates"

cd ~/GitRepos/dsoc.github.io

git pull origin master
echo "Finished Updating"
echo ''
echo 'Cleaning Old files...'
rm -rf ./notes
echo 'Clean Done!'
echo ''

echo 'Copying Files ...'
cp -R ~/cscao/notes/public/ notes
# mv notes/404/index.html 404.html
rm -r notes/404/
echo ''

# echo cscao.com >>CNAME
echo 'Copy Done!'
clear

read -p "Commit Message: " msg

echo "Updating Readme"
t=`date +"%Y-%m-%d-%H-%M-%S"`
echo "https://cscao.com/ src
==============
Source for site https://cscao.com/

Latest changes:$msg

Updated on $t" > README.md
echo ''

echo "Adding Files To Local Repo"
git add . -f
echo ''

echo 'Committing To Server...'

git commit -m "$msg"
echo 'Commit done!'
echo ''

echo 'Pushing To Server ...'
git push origin master
echo 'Deployed to GitHub!'
echo ''
