#!/bin/bash

mkdir -p nrrd-nocomp

for file in raw-nocomp/*; do
    dims=$(echo "$file" | rev | cut -d '_' -f 3 | rev)
    dimsspaces=$(echo $dims | tr 'x' ' ')
    name=$(echo "$file" | rev | cut -d '_' -f 4- | rev | xargs basename)
    unu make -i "$file" -t uchar -s $dimsspaces -o nrrd-nocomp/"$name".nrrd
done
