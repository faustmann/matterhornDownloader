#!/bin/bash

i=0
for var in "$@"
do
    i=$((i+1))
    echo "$var" 
    name="video_$i"
    mkdir $name
    cd $name
    id=$(echo "$var" | grep -o 'id=.*')
    url=$(curl -s "https://mh-engage.ltcc.tuwien.ac.at/search/episode.xml?$id" | xmlindent -i 4 -f | grep "<url>https.*Screen.flv" | sed -e 's/<url>//' | xargs)
    echo "test $url"
    wget -O $name $url
    cd ..
done


exit 0
