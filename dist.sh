#!/bin/sh
# if [ -z "$1" ]
# then
#   echo "Which folder do you want to deploy to GitHub Pages?"
#   echo "example: dist.sh ./build/web/"
#   exit 1
# fi

# echo $1

flutter pub get
flutter build web

rm -rf build_folder
mkdir -p build_folder
cp -a ./build/web/. ./build_folder

git add build_folder -f
# git add .
git commit -m "web-build-$(date)"

# git push origin --delete gh-pages
git subtree push --prefix build_folder origin gh-pages
# git push