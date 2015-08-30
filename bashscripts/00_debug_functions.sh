#!/bin/bash

# Functions for error and debug logging

DEBUG=1
LOG_FILE=$HOME/.debug
ERROR_FILE=$HOME/.error

# Debug function
function db {
    if [ $DEBUG -eq 1 ]; then
        echo "$@"
    fi
}

# Log function, handles input from stdin or from arguments
function logDebug {
    # If there are parameters read from parameters
    if [ $# -gt 0 ]; then
        echo "[$(date +"%D %T")] $@" >> $LOG_FILE
        db "$@"
    else 
    # If there are no parameters read from stdin
    while read data
        do
        echo "[$(date +"%D %T")] $data" >> $LOG_FILE 
        db "$data"
        done
    fi
}

# Error function
# Usage: error N message
function logError {
    echo "[$(date +"%D %T")] $@" >> $ERROR_FILE
    db "$@"
}
