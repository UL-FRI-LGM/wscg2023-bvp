#!/bin/bash

mkdir -p nrrd-comp

for file in raw-nocomp/*; do
    dims=$(echo "$file" | rev | cut -d '_' -f 3 | rev)
    dimsspaces=$(echo $dims | tr 'x' ' ')
    name=$(echo "$file" | rev | cut -d '_' -f 4- | rev | xargs basename)
    unu make -i "$file" -t uchar -s $dimsspaces | \
    unu save -f nrrd -e gz -o nrrd-comp/"$name".nrrd
done
