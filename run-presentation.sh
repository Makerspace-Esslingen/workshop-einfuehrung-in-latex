#!/bin/bash

python -m http.server 8080 &
echo started webserver: pid $( jobs -p )
xdg-open http://localhost:8080/presentation.html
trap 'echo "Killing webserver with pid $( jobs -p )..."; kill $( jobs -p )' SIGINT
wait

