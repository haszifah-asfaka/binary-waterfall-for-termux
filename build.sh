#!/bin/bash

MAINFAILENAME="binary-waterfall"
MODULENAME="binary_waterfall"

ORIGDIR=$(pwd)
SOURCEDIR="$ORIGDIR/src/$MODULENAME"
DISTDIR="$ORIGDIR/dist"
BUILDDIR="$ORIGDIR/build"

TARGETEXE="$ORIGDIR/$MAINFAILENAME"
SPEC="$ORIGDIR/$MAINFAILENAME.spec"

echo "Cleaning up before making release..."
rm -f "$TARGETEXE"
rm -rf "$DISTDIR"
rm -rf "$BUILDDIR"
rm -f "$SPEC"
rm -f "$ORIGDIR/file_version_info.txt"

# Catatan: Kita skip pembuatan .exe karena ini lingkungan Linux/Android.
# Kita langsung lompat ke pembuatan package Python (PyPI) jika tools-nya ada.

if command -v python3 &>/dev/null; then
    echo "Making PyPI release (Wheel & Source distribution)..."
    # Pastikan package 'build' sudah terinstall: pip install build
    python3 -m build
else
    echo "Python tidak ditemukan!"
    exit 1
fi

echo "Build done!"
exit 0
