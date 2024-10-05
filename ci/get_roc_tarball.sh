#!/bin/bash

# Download roc tarball

function get_roc_tarball() {
    local tarball_url
    local output_filename

    tarball_url=$1
    output_filename=$2

    if [ -z "$tarball_url" ]; then
        echo "Error: tarball_url is not set"
        return 1
    fi

    if [ -z "$output_filename" ]; then
        echo "Error: output_filename is not set"
        return 1
    fi

    # Download tarball with progress bar
    wget -O "$output_filename" "$tarball_url"

    echo "Downloaded roc tarball to $output_dir"

    return 0
}

alias get_roc_tarball=get_roc_tarball
# get_roc_tarball $TARBALL_URL

function extract_roc_tarball() {
    local tarball_file
    local output_dir

    tarball_file=$1
    output_dir=$2

    if [ -z "$tarball_file" ]; then
        echo "Error: tarball_file is not set"
        return 1
    fi

    if [ -z "$output_dir" ]; then
        echo "Error: output_dir is not set"
        return 1
    fi

    # Extract tarball
    tar -xvf "$tarball_file" -C "$output_dir"

    echo "Extracted roc tarball to $output_dir"

    return 0
}

alias extract_roc_tarball=extract_roc_tarball
