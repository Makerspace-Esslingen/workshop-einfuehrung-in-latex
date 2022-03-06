#!/bin/bash

pushd demonstration-files
watch -n 5 "rm *.aux *.fls *.fdb_latexmk *.synctex.gz *.log *.pdf"
popd
