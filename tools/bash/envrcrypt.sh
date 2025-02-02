#!/bin/bash

msg_usage=$(cat <<EOF
Usage: $0 [-p FILE_PATH] [-s] [-d] [-e]

Recursively search for all .envrc and/or encrypted files and perform an option.

Options:
  -l (default)       list option, list all .envrc and encrypted files found 
  -e                 encrypt option, using gpg on all .envrc files found
  -d                 decrypt option, using gpg on all encrypted files found

Optional Arguments:
  -p FILE_PATH       start at provided file path, defaults to HOME

Miscellaneous:
  -h, --help         display this help text and exit
EOF
)
msg_log="[Log] "
msg_err="[Error] "

file_path=$HOME

function log() {
    echo $msg_log $1
}

function err() {
    echo $msg_err $1
}

function check_file_path() {
    if [ ! -d "$file_path" ]; then
        err "Provided File Path is invalid"
        exit 1
    fi
}

function show_usage() {
    printf "%s\n" "$msg_usage"; exit $1
}

while getopts "p:sdeh" opt; do
    case "$opt" in
        p) file_path="$OPTARG" ;;
        l) echo l;;
        d) echo d;;
        e) echo e;;
        h | --help) show_usage 0;;
        *) show_usage 1;;
        ?) show_usage 1;;
    esac
done

check_file_path

log "Using file path $file_path"
