#!/bin/bash

# Checking for User Input (Argument or Stdin)
if [ "$#" -lt 1 ]; then
    echo "please provide value to change opacity to: "
    read VALUE_NEW
else
    VALUE_NEW=$1
fi

# Checking for size of input (only range 0-100 allowed)
if [ "${VALUE_NEW}" -gt 100 ]; then
    VALUE_NEW=100
fi

if [ "${VALUE_NEW}" -lt 0 ]; then
    VALUE_NEW=1
fi

# Setting up variables for the sed insertion
FILEP="/mnt/c/Users/Admin/AppData/Local/Packages/Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe/LocalState/settings.json"

LINE1=$(cat $FILEP | grep -n opacity | head -n 1)
LINE2=$(cat $FILEP | grep -n opacity | tail -n 1)

LINE_NO=$(echo $LINE2 | cut -d':' -f1)
VALUE_OLD=$(echo $LINE2 | cut -d',' -f1 | cut -d' ' -f3)

# Editing the line and saving the new version in a tmp file to then overwrite the old one
sed "${LINE_NO}s/${VALUE_OLD}/${VALUE_NEW}/" $FILEP > test_tmp.json
rm $FILEP
mv test_tmp.json $FILEP
