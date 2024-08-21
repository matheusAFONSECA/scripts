# PowerShell script: rename_files.ps1

# Set a global constant to be used in the file names - change this value to the desired constant
# The constant will be used in the file names as a suffix and the name of the file will be in the format: prefix_constant_00*.png
# This is the name of the folder to be accessed
$CONST = "teste"  # Replace with the desired constant

# Function to rename files in a directory and convert them to .png
function Rename-Files {
    param (
        [string]$Dir,
        [string]$Prefix
    )

    # Check if the directory exists
    if (-Not (Test-Path -Path $Dir -PathType Container)) {
        Write-Host "Directory not found: $Dir"
        return 1
    }

    # Initial counter
    $Count = 1

    # Iterate over all files in the directory
    Get-ChildItem -Path $Dir | ForEach-Object {
        $File = $_.FullName
        # Check if it's a regular file
        if (-Not $_.PSIsContainer) {
            # Create the new name with the .png extension and the week number
            $NewName = "{0}_{1}_{2:000}.png" -f $Prefix, $CONST, $Count

            # Rename the file with the new name
            $NewFilePath = Join-Path -Path $Dir -ChildPath $NewName
            Rename-Item -Path $File -NewName $NewFilePath

            # Check if the file was renamed successfully
            if (Test-Path -Path $NewFilePath) {
                Write-Host "File $File renamed to: $NewName"
            } else {
                Write-Host "Error renaming $File"
            }

            # Increment the counter
            $Count++
        }
    }

    Write-Host "Renaming completed in $Dir!"
}

# Rename files in the specified directory
Rename-Files -Dir $CONST -Prefix "prefix"
