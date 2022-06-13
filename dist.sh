#!/bin/sh
if [ -z "$1" ]
then
  echo "Which folder do you want to deploy to GitHub Pages?"
  echo "example: dist.sh ./build/web/"
  exit 1
fi

echo $1

flutter pub get
flutter build web

git add $1 -f
git commit -m "web-build-$(date)"

git subtree push --prefix $1 origin gh-pages