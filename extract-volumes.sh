#!/bin/bash

mkdir -p raw-comp raw-nocomp

files=$(for file in volumes/*.part*; do
    echo "${file%.part*}"
done | uniq)

for file in $files; do
    out=raw-comp/$(basename "$file")
    cat "$file".part* > "$out"
done

for file in raw-comp/*; do
    out=raw-nocomp/$(basename "$file")
    out="${out%.lz4}"
    lz4 "$file" "$out"
done
