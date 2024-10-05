#!/bin/bash

function compile() {
    local roc_bin
    local roc_src

    roc_bin=$(find ./dependencies -name roc -type f | head -n 1)
    roc_src=$1

    if [ -z "$roc_bin" ]; then
        echo "Error: roc_bin is not set"
        return 1
    fi

    if [ -z "$roc_src" ]; then
        echo "Error: roc_src is not set"
        return 1
    fi

    # Compile roc bash

    echo "Roc binary: $roc_bin"
    echo "Compiling roc bash: $roc_src"

    $roc_bin $roc_src

    return 0
}

alias compile=compile
compile "$1"
