#!/bin/bash
#
# Starts the user workspace
#

cmd=$1; shift

cd $HOME
if [[ -d $HOME/workspace ]]
then
        export PATH=$HOME/workspace:$PATH
        cd     $HOME/workspace
        [[ -f ./env.sh ]] && source env.sh

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

