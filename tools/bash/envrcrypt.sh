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
option_flag="l"

function log() {
    echo $msg_log $1 >&2
}

function err() {
    echo $msg_err $1 >&2
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

function get_all_envrc_files() {
    mapfile -t envrc_files < <(find "$file_path" -type f -name ".envrc")
}

function print_envrc_files() {
    for file in "${envrc_files[@]}"; do
        echo "$file"
    done
}

while getopts "p:ldeh" opt; do
    case "$opt" in
        p) file_path="$OPTARG" ;;
        l) option_flag="l";;
        d) option_flag="d";;
        e) option_flag="e";;
        h | --help) show_usage 0;;
        *) show_usage 1;;
        ?) show_usage 1;;
    esac
done

check_file_path

log "Using file path $file_path and option $option_flag"

case "$option_flag" in
    l) get_all_envrc_files; print_envrc_files;;
    d) ;;
    e) ;;
esac
