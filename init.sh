#!/bin/bash

# Variables

TARBALL_URL="https://github.com/roc-lang/roc/releases/download/nightly/roc_nightly-linux_x86_64-latest.tar.gz"
TARBALL_PATH="./tmp"
OUTPUT_FILENAME="roc_nightly-linux_x86_64-latest.tar.gz"
OUTPUT_DIR="./dependencies"

source ./ci/get_roc_tarball.sh

function init() {
    get_roc_tarball $TARBALL_URL "$TARBALL_PATH/$OUTPUT_FILENAME" &&
        extract_roc_tarball "$TARBALL_PATH/$OUTPUT_FILENAME" $OUTPUT_DIR

    echo $(ls $OUTPUT_DIR)

    return 0
}

alias init=init
