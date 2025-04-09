#!/bin/bash

msg_usage=$(cat <<EOF
Usage: $0 [-p FILE_PATH]

Recursively search for all .git repositories and display their git statuses.

Optional Arguments:
  -p FILE_PATH       start at provided file path, defaults to HOME

Miscellaneous:
  -h                 display this help text and exit
EOF
)

function show_usage() {
    printf "%s\n" "$msg_usage"; exit $1
}

while getopts "p:hp" opt; do
    case "$opt" in
        p) file_path="$OPTARG" ;;
        h | --help) show_usage 0;;
        *) show_usage 1;;
        ?) show_usage 1;;
    esac
done

ls --recursive --almost-all
