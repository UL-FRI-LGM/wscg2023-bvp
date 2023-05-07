#!/bin/bash

MODES=""
MODES+=" 4x4x4"
MODES+=" 6x6x6"
#MODES+=" 8x8x8" # this mode does not exist

for mode in $MODES; do
    astcenc-avx2 -cl male-crop-premultiplied/male.png male-$mode.astc $mode -thorough -zdim 360
    tail -c +17 male-$mode.astc > male-$mode.astc.raw
    lz4 male-$mode.astc.raw
done
