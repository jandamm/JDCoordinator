#!/bin/bash

echo "Run Sourcery"

sourcery --config ../..

if [[ $? -eq 127 ]]; then
	echo "warning: Sourcery is not installed."
	echo "warning: install with $ brew bundle"
fi

echo "Run SwiftFormat"

swiftformat ../.. --semicolons "never" --ranges "noSpace"

if [[ $? -eq 127 ]]; then
	echo "warning: SwiftFormat is not installed"
	echo "warning: install with $ brew bundle"
fi
