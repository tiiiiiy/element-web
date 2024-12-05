#!/bin/bash
set -x

ELEMENT_VERSION=$(curl -s https://api.github.com/repos/element-hq/element-web/releases/latest | grep -oP '"tag_name": "\K(.*?)(?=")')

if [ -z "$ELEMENT_VERSION" ]; then
  echo "Failed to get the latest version"
  exit 1
fi

curl -L -o element.tar.gz https://github.com/vector-im/element-web/releases/download/$ELEMENT_VERSION/element-$ELEMENT_VERSION.tar.gz

tar -xvf element.tar.gz
mv element-$ELEMENT_VERSION out
cp config/* out/
cp 404.html out/

# ./out is now ready.
