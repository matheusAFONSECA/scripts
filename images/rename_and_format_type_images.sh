#!/bin/bash

# Set a global constant to be used in the file names - change this value to the desired constant
# The constant will be used in the file names as a suffix and the name of the file will be in the format: prefix_constant_00*.png
# This is the name of the folder to be acessed
CONST="teste"  # Replace the desired constant

# Function to rename files in a directory and converte to .png
rename_files() {
    DIR="$1"
    PREFIX="$2"

    # Check if the directory exists
    if [ ! -d "$DIR" ]; then
        echo "Directory not found: $DIR"
        return 1
    fi

    # Initial counter
    COUNT=1

    # Iterate over all files in the directory
    for FILE in "$DIR"/*; do
        # Check if it's a regular file
        if [ -f "$FILE" ]; then
            # Create the new name with the .png extension and the week number
            NEW_NAME=$(printf "%s_%s_%03d.png" "$PREFIX" "$CONST" "$COUNT")

            # Rename the file with the new name
            mv "$FILE" "$DIR/$NEW_NAME"

            # Check if the file was renamed successfully
            if [ -e "$DIR/$NEW_NAME" ]; then
                echo "File $FILE renamed to: $NEW_NAME"
            else
                echo "Error renaming $FILE"
            fi

            # Increment the counter
            COUNT=$((COUNT + 1))
        fi
    done

    echo "Renaming completed in $DIR!"
}

# Rename files in the specified directories
rename_files "${CONST}" "prefix"

 