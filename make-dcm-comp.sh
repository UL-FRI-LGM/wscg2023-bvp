#!/bin/bash

mkdir -p dcm-comp

for file in raw-nocomp/*; do
    dims=$(echo "$file" | rev | cut -d '_' -f 3 | rev)
    name=$(echo "$file" | rev | cut -d '_' -f 4- | rev | xargs basename)
    output="dcm-comp/${name}.dcm"
    echo "$output"
    python raw2dcm-comp.py -i "$file" -d $dims -o "$output"
done
