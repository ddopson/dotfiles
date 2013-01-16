#!/bin/bash

DPKG=$(readlink -f "$1")

if [ ! -e "$DPKG" ]; then
  echo "Usage: $0 <package.deb>"
  exit 1
fi

TMP="/tmp/$(date +%s)-$(basename "$DPKG")"
mkdir "$TMP"
F="$TMP/control"
ar pf "$DPKG" control.tar.gz | tar -xzf- -C "$TMP"
if [ ! -e "$F" ]; then
  echo "Failed to find 'control' file in \"$1\" extracted to \"$TMP\""
  exit 1
fi

touch "$F.timestamp"
vim "$F"

if [ "$F" -nt "$F.timestamp" ]; then
  echo "Writing updated control file to $DPKG"
  cd $TMP
  tar -czf control.tar.gz control && ar rf "$DPKG" control.tar.gz
fi
