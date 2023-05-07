#!/bin/bash

lz4 mitos_512x512x512_1x1x1_uint32.raw.lz4
node ../raw2bvp-nocomp.js -i mitos_512x512x512_1x1x1_uint32.raw -d 512x512x512 -bd 32x32x32 -f '{"family":"mono","count":1,"size":4,"type":"u"}' -o mitos-nocomp.bvp
node ../raw2bvp-comp.js -i mitos_512x512x512_1x1x1_uint32.raw -d 512x512x512 -bd 32x32x32 -f '{"family":"mono","count":1,"size":4,"type":"u"}' -o mitos-comp.bvp
