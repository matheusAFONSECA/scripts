# PowerShell Script: update_and_create_requirements.ps1

# Verifica se estamos em um ambiente virtual
if (Test-Path env:VIRTUAL_ENV) {
    # Atualiza o arquivo requirements.txt com os pacotes instalados
    pip freeze > requirements.txt
    Write-Host "requirements.txt updated successfully."
} else {
    Write-Host "Not working in a virtual environment, skipping requirements update."
}
