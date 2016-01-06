#!/bin/bash
#
# Starts the user workspace
#

cmd=$1; shift
export PATH=$PATH:$HOME/bin/:/prly-bin/

cd $HOME

if [[ -d /workspace ]]
then
    rm -rf $HOME/workspace
    cp -R /workspace $HOME/workspace
    cd     $HOME/workspace

    export PATH=$HOME/workspace:$PATH

    [[ -f ./env.sh ]] && source env.sh

    echo "CMD=$cmd"

    if [[ -z "$cmd" && -f "startup.sh" ]]
    then
            cmd=startup.sh
    fi
fi

if [[ -z "$cmd" ]]
then
        cmd="bash"
fi

$cmd $*

