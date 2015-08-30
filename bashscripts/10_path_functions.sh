#!/bin/bash

# Functions for working with unix PATH variables. Saves them
# becoming full of duplicates etc.

addToPath() {
    [ $# -ne 1 ] && return 2
    
    if ! echo "$PATH" | grep '\(:\|^\)'"$1"'\(:\|$\)' >/dev/null
    then 
        PATH="$PATH:$1"
    else 
        return 1
    fi
}

addSource() {
    [ $# -eq 0 ] && return 2
    
    local -i code=0
    local arg

    for arg in "$@"; do
        if [-f "$arg" ]; then
            . "$arg"
        else
            false
        fi
        code+=$?
    done

    return $code
}

