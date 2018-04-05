#!/bin/bash

TAG=`git tag --merged HEAD --list 'v*' --sort=v:refname | tail -n 1`
VERSION=`echo $TAG | sed 's/\-[0-9]*\-[a-zA-Z0-9]*//' | sed 's/v//'`

CHECK=`echo $VERSION | sed -E s/^[0-9]+\.[0-9]+\.[0-9]+$/correct/`

if [[ $CHECK != 'correct' ]]; then
	exit 1
fi

# Set Version Number to latest tag.
find ../ -type f -name 'JDCoordinator.podspec' -exec sed -i '' -E "s/( *)s\.version( *)=( *)\"[0-9]+\.[0-9]+\.[0-9]+\"/\1s\.version\2=\3\"${VERSION}\"/" {} +

if [[ `git status --porcelain` != '' ]]; then
	git commit -a -m "Update build number to ${VERSION}."
fi
