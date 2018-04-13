#!/bin/bash

setInInfo () { # Info.plist path, Build, Version?
	PlistBuddy=/usr/libexec/PlistBuddy
	INFO_PLIST=$1
	INFO_BUILD=$2
	INFO_VERSION=$3
	if [[ -z $INFO_VERSION ]]; then
		INFO_VERSION=$INFO_BUILD	
	fi

	if [ -e $PlistBuddy ]; then 
		if ls "${INFO_PLIST}" 1> /dev/null 2>&1; then 
			$PlistBuddy -c "Set :CFBundleVersion ${INFO_BUILD}" "${INFO_PLIST}"
			$PlistBuddy -c "Set :CFBundleShortVersionString ${INFO_VERSION}" "${INFO_PLIST}"
			$PlistBuddy -c "Save" "${INFO_PLIST}"
		else
			echo "warning: ${INFO_PLIST} was not present"
		fi
	else
		echo "warning: PlistBuddy is not installed"
		exit 1
	fi
}

TAG=`git tag --merged HEAD --list 'v*' --sort=v:refname | tail -n 1`
VERSION=`echo $TAG | sed 's/\-[0-9]*\-[a-zA-Z0-9]*//' | sed 's/v//'`

CHECK=`echo $VERSION | sed -E s/^[0-9]+\.[0-9]+\.[0-9]+$/correct/`

if [[ $CHECK != 'correct' ]]; then
	exit 1
fi

# Set Version Number to latest tag.
find ../ -type f -name 'JDCoordinator.podspec' -exec sed -i '' -E "s/( *)s\.version( *)=( *)\"[0-9]+\.[0-9]+\.[0-9]+\"/\1s\.version\2=\3\"${VERSION}\"/" {} +

# Set Version in Info.plists
setInInfo './Example/JDCoordinator/Info.plist' $VERSION 
setInInfo './Example/Pods/Target Support Files/JDCoordinator/Info.plist' $VERSION

if [[ `git status --porcelain` != '' ]]; then
	git commit -a -m "Update build number to ${VERSION}."
fi
