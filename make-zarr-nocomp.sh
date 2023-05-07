#!/bin/bash

mkdir -p zarr-nocomp

for file in raw-nocomp/*; do
    dims=$(echo "$file" | rev | cut -d '_' -f 3 | rev)
    name=$(echo "$file" | rev | cut -d '_' -f 4- | rev | xargs basename)
    output="zarr-nocomp/${name}.zarr.zip"
    echo "$output"
    python raw2zarr-nocomp.py -i "$file" -d $dims -o "$output"
done
