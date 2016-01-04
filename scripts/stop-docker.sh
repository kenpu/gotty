#!/bin/bash

name=$1

if [[ ! -z "$name" ]]
then
    docker kill $name 
    docker rm $name
fi
