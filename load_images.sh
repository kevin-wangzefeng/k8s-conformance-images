#!/bin/bash

image_root=./images
files=$(ls $image_root)

for filename in $files
do
    docker load -i $image_root/$filename
done

echo "All images loaded."
echo "Sleeping infinitly"

while true
do
    sleep 3600 &
    wait
done
