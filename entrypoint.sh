#!/bin/bash
set -e
cd /data
git clone  $GIT_REPO -b master repository
cd repository
cp guide.xml /data/guide.xml
/defaults/update.sh

git config --global user.email "root"
git config --global user.name "root"

cd /data/repository
git checkout --orphan new-master
cp /data/guide.xml /data/repository/guide.xml
git add .
git commit -m "Update"
git branch -m master old-master
git branch -m new-master master
git push --force --set-upstream origin master
git branch -D old-master
git push
