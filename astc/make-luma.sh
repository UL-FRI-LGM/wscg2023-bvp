#!/bin/bash

set -euo pipefail

mkdir -p male-luma

FILTERS=""
FILTERS+="color=color=black:size=768x768[black];"
FILTERS+="[black][0]overlay[over];"
FILTERS+="[over]colorchannelmixer=0.2126:0.7152:0.0722:0:0.2126:0.7152:0.0722:0:0.2126:0.7152:0.0722:0[out]"

for file in male-crop/*; do
    name=$(basename "$file")
    output=male-luma/$name
    ffmpeg -y -i "$file" -filter_complex "$FILTERS" -map '[out]' -frames:v 1 "$output"
done
