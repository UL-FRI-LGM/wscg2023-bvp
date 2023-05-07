#!/bin/bash

mkdir -p nii-comp

for file in raw-nocomp/*; do
    dims=$(echo "$file" | rev | cut -d '_' -f 3 | rev)
    name=$(echo "$file" | rev | cut -d '_' -f 4- | rev | xargs basename)
    output="nii-comp/${name}.nii.gz"
    echo "$output"
    python raw2nii-comp.py -i "$file" -d $dims -o "$output"
done
