#!/bin/bash

set -euo pipefail

mkdir -p male-crop

FILTERS=""
FILTERS+="crop=768:768:632:224[crop];"
FILTERS+="[crop]split=3[split1][split2][split3];"
FILTERS+="[split1]chromakey=color=0x1e5899:similarity=0.1:blend=0.03[chromakey1];"
FILTERS+="[split2]chromakey=color=0x162d46:similarity=0.055:blend=0.02[chromakey2];"
FILTERS+="[split3]chromakey=color=0x7c8a6a:similarity=0.02:blend=0.02[chromakey3];"
FILTERS+="[chromakey1][chromakey2]blend=c3_mode=multiply[blend1];"
FILTERS+="[blend1][chromakey3]blend=c3_mode=multiply[out]"

for file in male/*; do
    name=$(basename "$file")
    num=${name%.png}
    num=${num#a_vm}
    num=$((num - 1001))
    output=male-crop/male_${num}.png
    ffmpeg -y -i "$file" -filter_complex "$FILTERS" -map '[out]' "$output"
done
