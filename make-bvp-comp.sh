#!/bin/bash

mkdir -p bvp-comp

for file in raw-nocomp/*; do
    dims=$(echo "$file" | rev | cut -d '_' -f 3 | rev)
    name=$(echo "$file" | rev | cut -d '_' -f 4- | rev | xargs basename)
    output="bvp-comp/${name}.bvp.saf"
    format='{"family":"mono","count":1,"size":1,"type":"u"}'
    echo "$output"
    node raw2bvp-comp.js -i "$file" -d $dims -bd 32x32x32 -f "$format" -o "$output"
done
