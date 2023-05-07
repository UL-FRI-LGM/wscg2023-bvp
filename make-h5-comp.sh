#!/bin/bash

mkdir -p h5-comp

for file in raw-nocomp/*; do
    dims=$(echo "$file" | rev | cut -d '_' -f 3 | rev)
    name=$(echo "$file" | rev | cut -d '_' -f 4- | rev | xargs basename)
    output="h5-comp/${name}.h5"
    echo "$output"
    python raw2h5-comp.py -i "$file" -d $dims -o "$output"
done
