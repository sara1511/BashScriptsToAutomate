#!/usr/bin/env bash

#install the global package flamebearer and autocannon
npm install -g flamebearer autocannon

#run the Load test using autocannon
autocannon -c 10 -d 5 -l https://web-app-name.azurewebsites.net/
autocannon -c 10 -d 5 -l -m POST https://web-app-name.azurewebsites.net/data -b '{"x":1}'
autocannon -c 10 -d 10 -l -m POST https://web-app-name.azurewebsites.net/data -b '{"x":2}'
autocannon -c 10 -d 15 -l -m POST https://web-app-name.azurewebsites.net/data -b '{"x":3}'
autocannon -c 10 -d 20 -l -m POST https://web-app-name.azurewebsites.net/data -b '{"x":4}'
autocannon -c 10 -d 30 -l -m POST https://web-app-name.azurewebsites.net/data -b '{"x":5}'

#run the profiler command to generate the flamegraph
npm run profiler

#create the index.html file from the flamegraph.html
#mv flamegraph.html index.html
