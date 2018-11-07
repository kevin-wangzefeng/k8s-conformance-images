#!/bin/bash

image_root=./images
mkdir -p ${image_root}

for image in $(cat images.txt)
do
    echo "saving image" $image
    image_file_name=$(echo $image | sed -E 's/[/:]/_/g')
    
    docker images | awk '{print $1":"$2}' | grep -q $image 
    if [[ "$?" -ne "0" ]]; then
        # need pull image
        docker pull $image
    fi
    
    docker save $image -o ${image_root}/${image_file_name}.tar.gz
done
