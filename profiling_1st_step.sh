#!/usr/bin/env bash

#install jq to edit json file using json cli in bash
#apt-get install jq
apt install jq -y

#bash script prof.sh to edit the scripts start command to add the --prof argument and new profiler script "node --prof-process --preprocess -j isolate*.log | flamebearer"
startscr=$(jq '.scripts.start' package.json)
if [[ $startscr != *" --prof"* ]]; then
        startscr="$(echo "$startscr" | tr -d '"')"
        words=($startscr)
        newarr=("${words[@]:0:1}" "--prof" "${words[@]:1}")
        finalscr=$(printf " %s" "${newarr[@]}")
        finalscr=${finalscr:1}
        jq '.scripts.start = $newval' --arg newval "$finalscr" package.json > tmp.$$.json && mv tmp.$$.json package.json
else
        echo "profiler already present"
fi
jq '.scripts.profiler = $new' --arg new 'node --prof-process --preprocess -j isolate*.log | flamebearer' package.json > tmp.$$.json && mv tmp.$$.json package.json
