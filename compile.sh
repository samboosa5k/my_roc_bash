#!/bin/bash

function compile() {
    local roc_cmd
    local roc_cmd_exists
    local roc_src

    roc_cmd="roc --prebuilt-platform"
    roc_src=$1

    # check if roc_cmd resolves to a valid command
    if ! roc_cmd_exists=$(command -v roc); then
        echo "Error: roc command not found"
        return 1
    fi

    if [ -z "$roc_src" ]; then
        echo "Error: roc_src is not set"
        return 1
    fi

    # Compile roc bash

    echo "Roc cmd: $roc_cmd"
    echo "Compiling roc bash: $roc_src"

    roc --prebuilt-platform $roc_src

    return 0
}

alias compile=compile
compile "$1"
