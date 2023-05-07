#!/bin/bash

mkdir -p vti-comp

for file in raw-nocomp/*; do
    dims=$(echo "$file" | rev | cut -d '_' -f 3 | rev)
    name=$(echo "$file" | rev | cut -d '_' -f 4- | rev | xargs basename)
    output="vti-comp/${name}.vti"
    echo "$output"
    python raw2vti-comp.py -i "$file" -d $dims -o "$output"
done
