# PowerShell script: git_copyright.ps1

# Setting parameters for copyright
$authors = "Álvaro Ribeiro, Matheus Fonseca"

# Function to add copyright to files
function Add-Copyright {
    param (
        [string]$fileExtension,
        [string]$commentPrefix = "#"
    )

    Get-ChildItem -Recurse -File -Filter "*.$fileExtension" | ForEach-Object {
        $file = $_.FullName
        if (-not (Select-String -Pattern "Creation Date:" -Path $file)) {
            $date = Get-Date -Format "yyyy-MM-dd"
            $year = Get-Date -Format "yyyy"
            $copyrightText = $commentPrefix + " Creation Date: $date`n" +
                            $commentPrefix + " Authors: $authors`n" +
                            $commentPrefix + " Copyright $year.`n" +
                            $commentPrefix + " All rights are reserved. Reproduction in whole or part is prohibited without the written consent of the copyright owner.`n"

            # Lê o conteúdo existente do arquivo
            $existingContent = Get-Content -Path $file

            # Adiciona o copyright no início e mantém o conteúdo existente
            $newContent = $copyrightText + "`n" + $existingContent -join "`n"
            Set-Content -Path $file -Value $newContent
        }
    }
}

# Add copyright to Python and YAML files
Add-Copyright -fileExtension "py"
Add-Copyright -fileExtension "yaml"

# Add copyright to Dockerfiles
Get-ChildItem -Recurse -File -Filter "Dockerfile" | ForEach-Object {
    $file = $_.FullName
    if (-not (Select-String -Pattern "Creation Date:" -Path $file)) {
        $date = Get-Date -Format "yyyy-MM-dd"
        $year = Get-Date -Format "yyyy"
        $copyrightText = "# Creation Date: $date`n" +
                        "# Authors: $authors`n" +
                        "# Copyright $year.`n" +
                        "# All rights are reserved. Reproduction in whole or part is prohibited without the written consent of the copyright owner.`n"

        # Lê o conteúdo existente do arquivo
        $existingContent = Get-Content -Path $file

        # Adiciona o copyright no início e mantém o conteúdo existente
        $newContent = $copyrightText + "`n" + $existingContent -join "`n"
        Set-Content -Path $file -Value $newContent
    }
}

# Add copyright to Jenkinsfiles
Get-ChildItem -Recurse -File -Filter "Jenkinsfile" | ForEach-Object {
    $file = $_.FullName
    if (-not (Select-String -Pattern "Creation Date:" -Path $file)) {
        $date = Get-Date -Format "yyyy-MM-dd"
        $year = Get-Date -Format "yyyy"
        $copyrightText = "// Creation Date: $date`n" +
                        "// Authors: $authors`n" +
                        "// Copyright $year.`n" +
                        "// All rights are reserved. Reproduction in whole or part is prohibited without the written consent of the copyright owner.`n"

        # Lê o conteúdo existente do arquivo
        $existingContent = Get-Content -Path $file

        # Adiciona o copyright no início e mantém o conteúdo existente
        $newContent = $copyrightText + "`n" + $existingContent -join "`n"
        Set-Content -Path $file -Value $newContent
    }
}
