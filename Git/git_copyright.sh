#!/bin/bash

# Setting parameters for copyright
authors="Álvaro Ribeiro, Matheus Fonseca"

# add copyright python and yaml files
find ./* -regex ".*\.\(py\|yaml\)" -print0 |
while IFS= read -r -d '' file; do
    if grep -q "Creation Date:" "$file"; then
        :
    else
        sed -i "1 i# Creation Date: $(date "+%Y-%m-%d")\n# Authors $authors\n# Copyright $(date "+%Y").\n# All rights are reserved. Reproduction in whole or part is prohibited without the written consent of the copyright owner.\n" $file
    fi
done

# add copyright for dockerfiles
find . -type f \( -name "Dockerfile" \) -print0 |
while IFS= read -r -d '' file; do
    if grep -q "Creation Date:" "$file"; then
        :
    else
        sed -i "1 i# Creation Date: $(date "+%Y-%m-%d")\n# Authors $authors\n# Copyright $(date "+%Y").\n# All rights are reserved. Reproduction in whole or part is prohibited without the written consent of the copyright owner.\n" $file
    fi
done

# add copyright for jenkinsfiles
find . -type f \( -name "Jenkinsfile" \) -print0 |
while IFS= read -r -d '' file; do
    if grep -q "Creation Date:" "$file"; then
        :
    else
        sed -i "1 i// Creation Date: $(date "+%Y-%m-%d")\n# Authors: $authors\n# Copyright $(date "+%Y").\n# All rights are reserved. Reproduction in whole or part is prohibited without the written consent of the copyright owner.\n" $file
    fi
done