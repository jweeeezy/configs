#!/bin/bash

# History File Path
HISTORY_FILE="~/.bash_history"


# Helper Function
# Hint: Add or remove keywords to search for as you like
function has_credential() {
    local line="$1"
    local keywords=("password" "api" "key" "pw")

    line="${line,,}"

    for keyword in "${keywords[@]}"; do
        if [[ "$line" =~ $keyword ]]; then
            return 0
        fi
    done

    return 1
}


# Step 1: Read History File
# Read line per line from HISTORY_FILE
# if credential found:
#   save line into buffer with credentials
# if no:
#   save line into clean buffer
while IFS= read -r line
do
    if has_credential "$line"; then
        BUFFER_CREDENTIALS+="$line"$'\n'
    else
        BUFFER_CLEAN+="$line"$'\n'
    fi
done < $(eval echo "$HISTORY_FILE")


# Step 2: User Prompt with Results
# Show User lines with credentials found and prompt whether deletion is wanted
# If no credentials were found exit the program
if [[ -z "$BUFFER_CREDENTIALS" ]]; then
    echo "No credentials found in history."
    exit 0
fi
echo -e "Lines with credentials found:\n"
echo "$BUFFER_CREDENTIALS"
read -p "Do you want to remove these lines from your history? (y/N): " choice
choice="${choice,,}"


# Step 3: Execute Users Choice
# On accept:
#   Use Clean_Buffer to overwrite HISTORY_FILE
# On decline:
#   Do Nothing
if [[ "$choice" == "y" || "$choice" == "yes" ]]; then
    echo -n "$BUFFER_CLEAN" > $(eval echo "$HISTORY_FILE")
    echo "Sensitive lines removed from history."
else
    echo "No changes made."
fi
