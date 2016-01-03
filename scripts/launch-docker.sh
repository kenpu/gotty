#!/bin/bash

name=$1; shift
if [[ -z "$name" ]]
then
    echo "Missing name"
    exit 0
fi

image=$1; shift

if [[ -z "$image" ]]
then
    echo "Missing image."
    exit 0
fi

docker run --name $name -it --rm $image $*
