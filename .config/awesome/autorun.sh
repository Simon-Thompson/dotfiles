#!/bin/sh
#nitrogen --restore &
#picom &
#exec awesome

function run {
    if ! pgrep -f "$1" ;
    then
        $@&
    fi
}

run "nitrogen --restore"
run "picom"
