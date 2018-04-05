#!/bin/bash

jazzy

if [[ `git status --porcelain` != '' ]]; then
	git commit -a -m 'Update jazzy documentation.'
fi