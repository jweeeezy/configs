#!/bin/bash

TEMPLATE_DIR="/home/$USER/configs/project_templates/"
OPTIONS=$(ls $TEMPLATE_DIR)

echo "Choose one:"
echo
echo $OPTIONS
echo
read -p "> " USER_INPUT
echo

if echo "$OPTIONS" | grep -qx "$USER_INPUT"; then
    echo "You inserted the < $USER_INPUT > project template"
    cp -r $TEMPLATE_DIR$USER_INPUT/* ./
    else
        echo "Invalid option selected!"
        fi
