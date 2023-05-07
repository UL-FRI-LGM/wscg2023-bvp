#!/bin/bash

set -euo pipefail

mkdir -p male-crop-premultiplied

for file in male-crop/*; do
    name=$(basename "$file")
    output=male-crop-premultiplied/$name
    echo "$output"
    convert "$file" '(' +clone -alpha Extract ')' -channel RGB -compose Multiply -composite "$output"
done
