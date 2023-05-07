#!/bin/bash

mkdir -p nii-nocomp

for file in raw-nocomp/*; do
    dims=$(echo "$file" | rev | cut -d '_' -f 3 | rev)
    name=$(echo "$file" | rev | cut -d '_' -f 4- | rev | xargs basename)
    output="nii-nocomp/${name}.nii"
    echo "$output"
    python raw2nii-nocomp.py -i "$file" -d $dims -o "$output"
done
