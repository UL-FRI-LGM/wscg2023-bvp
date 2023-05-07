#!/bin/bash

mkdir -p dcm-nocomp

for file in raw-nocomp/*; do
    dims=$(echo "$file" | rev | cut -d '_' -f 3 | rev)
    name=$(echo "$file" | rev | cut -d '_' -f 4- | rev | xargs basename)
    output="dcm-nocomp/${name}.dcm"
    echo "$output"
    python raw2dcm-nocomp.py -i "$file" -d $dims -o "$output"
done
