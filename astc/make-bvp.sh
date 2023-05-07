#!/bin/bash

MODES=""
MODES+=" 4x4x4"
MODES+=" 6x6x6"

BLOCKS=""
BLOCKS+=" 24x24x24"
BLOCKS+=" 48x48x48"

for mode in $MODES; do
    for block in $BLOCKS; do
        microblock="["$(echo $mode | tr x ,)"]"
        echo male-"$mode"-"$block".bvp.saf
        node ../raw2bvp-nocomp.js -i male-$mode.astc.raw -d 768x768x360 -bd $block -f "{\"family\":\"astc\",\"microblockDimensions\":$microblock}" -o male-"$mode"-"$block".bvp.saf
        echo male-"$mode"-"$block"-lz4.bvp.saf
        node ../raw2bvp-comp.js   -i male-$mode.astc.raw -d 768x768x360 -bd $block -f "{\"family\":\"astc\",\"microblockDimensions\":$microblock}" -o male-"$mode"-"$block"-lz4.bvp.saf
    done
done
