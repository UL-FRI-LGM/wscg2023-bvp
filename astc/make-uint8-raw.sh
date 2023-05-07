#!/bin/bash

set -euo pipefail

mkdir -p male-raw

for file in male-luma/*; do
    name=$(basename "$file")
    name=${name%.png}
    output=gray:male-raw/$name.raw
    echo "$name"
    convert $file $output
done

find male-raw -type f | sort -V | xargs -d '\n' cat > male-uint8.raw
