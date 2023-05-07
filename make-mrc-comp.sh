#!/bin/bash

mkdir -p mrc-comp

for file in raw-nocomp/*; do
    dims=$(echo "$file" | rev | cut -d '_' -f 3 | rev)
    name=$(echo "$file" | rev | cut -d '_' -f 4- | rev | xargs basename)
    output="mrc-comp/${name}.mrc.gz"
    echo "$output"
    python raw2mrc-comp.py -i "$file" -d $dims -o "$output"
done
