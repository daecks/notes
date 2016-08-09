#!/bin/bash
echo "Pulling Updates"

cd ~/GitRepos/cscao
# git init
# git add .
# git commit -m "My first commit"
# git remote add origin git@github.com:Vigorass/cscao.git
git pull origin master
echo "Finished Updating"
echo ''
echo 'Cleaning Old files...'
rm -rf *
echo 'Clean Done!'
echo ''

echo 'Copying Source Files To Git Repo...'
cp -R ~/cscao/notes/source .
cp -R ~/cscao/notes/themes .
cp -R ~/cscao/notes/scaffolds .
cp ~/cscao/notes/_config.yml .
cp ~/cscao/notes/LICENSE .
cp ~/cscao/notes/*.sh .


echo ''

clear
read -p "Commit Message: " msg

echo "Updating Readme"
t=`date +"%Y-%m-%d-%H-%M-%S"`
echo "cscaoconfig src
==============
These are Hexo configuration files for site cscao.com

Latest changes:$msg

Updated on $t" >> README.md
echo ''

echo 'Adding Files To Local Repo...'
git add . -f
echo 'Git Add done!'
echo ''

echo 'Committing To Server...'
t=`date +"%Y-%m-%d-%H-%M-%S"`
git commit -m "$msg"
echo 'Committing Done!'
echo ''

echo 'Pushing To Server ...'
git push origin master
echo 'Updated On GitHub!'
echo ''


echo 'Copy all files to DropBox'
zip -rq ~/Dropbox/DevNotesBlog.zip ~/cscao/notes/*
echo 'All finished!'
echo ''