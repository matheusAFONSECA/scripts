# PowerShell Script: create_and_activate_venv.ps1

# Fixed name for the virtual environment
$venvName = "venv"

# Automatically detect the Python path
$pythonPath = (Get-Command python).Source

# Check if the virtual environment already exists
if (Test-Path "$venvName/Scripts/Activate") {
    Write-Host "The virtual environment '$venvName' has already been created and activated."
} else {
    # Create the virtual environment
    Write-Host "Creating the virtual environment '$venvName'..."
    & $pythonPath -m venv $venvName

    # Verify if the creation was successful
    if (Test-Path "$venvName/Scripts/Activate") {
        # Activate the virtual environment
        Write-Host "Activating the virtual environment..."
        & .\$venvName\Scripts\Activate

        Write-Host "Virtual environment '$venvName' created and activated."
    } else {
        Write-Host "Error creating the virtual environment '$venvName'. Check permissions and try again."
        exit
    }
}

# Create a .gitignore file and add the virtual environment name to it
$gitignorePath = ".gitignore"
if (-not (Test-Path $gitignorePath)) {
    Write-Host "Creating .gitignore file..."
    New-Item -Path $gitignorePath -ItemType File
}

# Add the virtual environment name to .gitignore
$venvEntry = "$venvName/"
$gitignoreContent = Get-Content $gitignorePath

if ($gitignoreContent -notcontains $venvEntry) {
    Add-Content -Path $gitignorePath -Value "`n$venvEntry"
    Write-Host "'$venvName/' has been added to .gitignore."
} else {
    Write-Host "'$venvName/' is already in .gitignore."
}