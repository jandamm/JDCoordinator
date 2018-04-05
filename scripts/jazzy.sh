#!/bin/bash

# Set copyright end year to current year
find ../ -type f -name '.jazzy.yaml' -exec sed -i '' -E "s/^copyright: \'(.*) 2016 - [0-9]{4}/copyright: \'\1 2016 - $(date +%Y)/" {} +

jazzy

if [[ `git status --porcelain` != '' ]]; then
	git commit -a -m 'Update jazzy documentation.'
fi
