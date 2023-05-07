#!/bin/bash

./download.sh
./crop.sh
./make-premultiplied.sh
./make-luma.sh
./make-uint8-raw.sh
./make-astc.sh
./make-bvp.sh
