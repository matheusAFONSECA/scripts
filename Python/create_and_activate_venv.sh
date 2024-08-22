#!/bin/bash

# Fixed name for the virtual environment
venvName="venv"

# Automatically detect the Python path
pythonPath=$(command -v python)

# Check if the virtual environment already exists
if [ -d "$venvName" ]; then
    echo "The virtual environment '$venvName' has already been created and activated."
else
    # Create the virtual environment
    echo "Creating the virtual environment '$venvName'..."
    $pythonPath -m venv $venvName

    # Verify if the creation was successful
    if [ -f "$venvName/bin/activate" ]; then
        # Activate the virtual environment
        echo "Activating the virtual environment..."
        source $venvName/bin/activate

        echo "Virtual environment '$venvName' created and activated."
    else
        echo "Error creating the virtual environment '$venvName'. Check permissions and try again."
        exit 1
    fi
fi

# Create a .gitignore file and add the virtual environment name to it
gitignorePath=".gitignore"
if [ ! -f $gitignorePath ]; then
    echo "Creating .gitignore file..."
    touch $gitignorePath
fi

# Add the virtual environment name to .gitignore
venvEntry="$venvName/"
if ! grep -q "^$venvEntry\$" $gitignorePath; then
    echo "$venvEntry" >> $gitignorePath
    echo "'$venvName/' has been added to .gitignore."
else
    echo "'$venvName/' is already in .gitignore."
fi
