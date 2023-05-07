#!/bin/bash

mkdir -p vdb-comp

for file in raw-nocomp/*; do
    dims=$(echo "$file" | rev | cut -d '_' -f 3 | rev)
    name=$(echo "$file" | rev | cut -d '_' -f 4- | rev | xargs basename)
    output="vdb-comp/${name}.vdb"
    echo "$output"
    python raw2vdb-comp.py -i "$file" -d $dims -o "$output"
    lz4 "$output" "$output".lz4
    rm "$output"
done
