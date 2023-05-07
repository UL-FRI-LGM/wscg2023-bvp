#!/bin/bash

mkdir -p mrc-nocomp

for file in raw-nocomp/*; do
    dims=$(echo "$file" | rev | cut -d '_' -f 3 | rev)
    name=$(echo "$file" | rev | cut -d '_' -f 4- | rev | xargs basename)
    output="mrc-nocomp/${name}.mrc"
    echo "$output"
    python raw2mrc-nocomp.py -i "$file" -d $dims -o "$output"
done
