#!/bin/bash

echo "Run Sourcery"

sourcery --config ../..

if [[ $? -eq 127 ]]; then
	echo ""
	echo "‼️---⚠️---‼️"
	echo "Sourcery is not installed."
	echo "$ brew bundle"
	echo "‼️---⚠️---‼️"
	echo ""
fi

echo "Run SwiftFormat"

swiftformat ../.. --semicolons "never"

if [[ $? -eq 127 ]]; then
	echo ""
	echo "‼️---⚠️---‼️"
	echo "SwiftFormat is not installed."
	echo "$ brew bundle"
	echo "‼️---⚠️---‼️"
	echo ""
fi
