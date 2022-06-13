#!/bin/sh
if [ -z "$1" ]
then
  echo "Which folder do you want to deploy to GitHub Pages?"
  exit 1
fi

flutter pub get
flutter build web
cp $1 ./dist/web/

git add .
git commit -m "web-build-$(date)"

git subtree push --prefix ./dist/web/ origin gh-pages