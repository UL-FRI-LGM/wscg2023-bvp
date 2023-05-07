#!/bin/bash

cd $(dirname "$0")
mkdir -p male
cd male

BASEURL='https://data.lhncbc.nlm.nih.gov/public/Visible-Human/Male-Images/PNG_format/head'

for i in {1001..1377}; do
    wget "$BASEURL/a_vm$i.png"
done
