#!/bin/bash

mkdir -p vdb-nocomp

for file in raw-nocomp/*; do
    dims=$(echo "$file" | rev | cut -d '_' -f 3 | rev)
    name=$(echo "$file" | rev | cut -d '_' -f 4- | rev | xargs basename)
    output="vdb-nocomp/${name}.vdb"
    echo "$output"
    python raw2vdb-nocomp.py -i "$file" -d $dims -o "$output"
done
