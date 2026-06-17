#!/bin/bash

ORIGDIR=$(pwd)
DISTDIR="$ORIGDIR/dist"

rm -rf "$DISTDIR"

echo "Making PyPI release..."
python3 -m build

if [ "$1" == "upload" ]; then
    echo "Uploading to PyPI..."
    # Pastikan twine sudah terinstall: pip install twine
    twine upload "$DISTDIR"/*
fi

echo "Build done!"
exit 0
