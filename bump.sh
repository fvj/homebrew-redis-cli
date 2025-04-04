#!/bin/bash

set -euo pipefail

if [[ "$#" -ne 1 ]]; then
	echo "Usage: $0 <version>"
	exit 1
fi

VERSION=$1

BASE_URL="https://github.com/redis/redis/archive/refs/tags/"
RUBY_URL="${BASE_URL}#{version}.tar.gz"
FILE_HASH_URL="${BASE_URL}${VERSION}.tar.gz"
FILE_HASH=$(curl -Ls $FILE_HASH_URL | shasum -a 256 | cut -d' ' -f1)
OLD_FORMULAR=$(<redis-cli.rb)

awk -v version=$VERSION -v file_hash=$FILE_HASH -v ruby_url=$RUBY_URL '
	/^[[:space:]]+version/ { sub(/"[^"]+"/, "\"" version "\"") } 
	/^[[:space:]]*sha256/ { sub(/"[^"]+"/, "\"" file_hash "\"") } 
	/^[[:space:]]*url/ { sub(/"[^"]+"/, "\"" ruby_url "\"") } 
	{ print }
' <<< "$OLD_FORMULAR" > redis-cli.rb
