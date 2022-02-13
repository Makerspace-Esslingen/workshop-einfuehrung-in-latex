#!/bin/bash

python -m http.server 8080 &
xdg-open http://localhost:8080/presentation.html
wait
