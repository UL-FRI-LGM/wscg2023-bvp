#!/bin/bash

mkdir -p vti-nocomp

for file in raw-nocomp/*; do
    dims=$(echo "$file" | rev | cut -d '_' -f 3 | rev)
    name=$(echo "$file" | rev | cut -d '_' -f 4- | rev | xargs basename)
    output="vti-nocomp/${name}.vti"
    echo "$output"
    python raw2vti-nocomp.py -i "$file" -d $dims -o "$output"
done
