#!/bin/bash

mkdir -p h5-nocomp

for file in raw-nocomp/*; do
    dims=$(echo "$file" | rev | cut -d '_' -f 3 | rev)
    name=$(echo "$file" | rev | cut -d '_' -f 4- | rev | xargs basename)
    output="h5-nocomp/${name}.h5"
    echo "$output"
    python raw2h5-nocomp.py -i "$file" -d $dims -o "$output"
done
