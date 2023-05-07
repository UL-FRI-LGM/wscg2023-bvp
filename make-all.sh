#!/bin/bash

./extract-volumes.sh

./make-bvp-nocomp.sh
./make-dcm-nocomp.sh
./make-h5-nocomp.sh
./make-mrc-nocomp.sh
./make-nii-nocomp.sh
./make-nrrd-nocomp.sh
./make-vdb-nocomp.sh
./make-vti-nocomp.sh
./make-zarr-nocomp.sh

./make-bvp-comp.sh
./make-dcm-comp.sh
./make-h5-comp.sh
./make-mrc-comp.sh
./make-nii-comp.sh
./make-nrrd-comp.sh
./make-vdb-comp.sh
./make-vti-comp.sh
./make-zarr-comp.sh
