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

workspace=$1; shift
if [[ -z "$workspace" ]]
then
    echo "Missing workspace"
    exit 0
fi

bindir=`dirname $0`
cd $bindir

mnt="-v $PWD/prly-bin:/prly-bin:ro"
if [[ -d $workspace ]]
then
    mnt="$mnt -v $workspace:/home/user/workspace:ro"
fi

docker run          \
    --name $name    \
    -h docker $mnt  \
    --net none      \
    -it             \
    --rm            \
    -u=user         \
    $image /prly-bin/bootstrap.sh $*
