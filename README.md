# Scripts
Repository created to make scripts in bash and powershell to automate repetitive commands or simple tasks.

## Table of Contents
- [Overview](#overview)
- [Git](#git)
    - [Copyright](#copyright)
    - [Commit](#commit)
- [Images](#images)
    - [Rename and format image types](#rename-and-format-image-types)
- [Python](#python)
    - [Create and Activate Virtual Environment](#create-and-activate-virtual-environment)

## Overview
This repository contains various Bash and Shell scripts designed to automate repetitive tasks. It is organized into different folders, each dedicated to specific types of tasks or programming languages.

## Git

The `Git` section includes scripts that automate key tasks related to Git operations.

### Copyright

This script automates the process of adding copyright information to your code files (YAML, python, jenkinsfile, dockerS). It scans the files and inserts the appropriate copyright header, ensuring that your code is properly attributed and protected.

To run the script that make this task you can use this command:

- **Windows:**
```shell
.\Git\git_copyright.ps1
```

- **Linux and macOS:**
```bash
./Git/git_copyright.sh
```

### Commit

The commit script simplifies the process of committing changes to your Git repository. It allows you to automate the commit process by specifying files to include in the commit and uses a `message.txt` file where you can write the commit message. This helps maintain a consistent and organized history of changes in your repository.

To run the script that make this task you can use this command:

- **Windows:**
```shell
.\Git\git_commit.ps1
```

- **Linux and macOS:**
```bash
./Git/git_commit.sh
```

`remember:` if you want to make this script executable, you need to use the command `git config --global core.editor "nano"` to make it possible to edit, save and send the message wroted.

## Images
The `Images` directory is dedicated to storing scripts related to image processing tasks. 

### Rename and format image types
This includes scripts for converting image formats to `.png` and renaming files according to a predefined pattern. The scripts are designed to be flexible, allowing you to specify the folder where the images are stored and the output format.

To run the script that make this task you can use this command:

- **Windows:**
```shell
.\images\rename_and_format_type_images.ps1
```

- **Linux and macOS:**
```bash
./images/rename_and_format_type_images.sh
```

`remember:` if you want to make this script executable, you need to use the command `chmod +x <file_name.sh>` to make it possible to run.


## Python

The `Python` section includes scripts that automate key tasks related to Python operations.

### Create and Activate Virtual Environment

This script automates the process of creating and activating a virtual environment for Python projects. The virtual environment helps manage dependencies and isolate project-specific packages. If the virtual environment is already created, a warning is showed and the venv is activate.

To run the script, use the following command based on your operating system:

- **Windows:**
```shell
.\Python\create_and_activate_venv.ps1
```

- **Linux and macOS:**
```bash
./Python/create_and_activate_venv.sh
```

### Updating and Creating Requirements

This script automates the process of creating and updating a `requirements.txt` file for Python projects. The `requirements.txt` file is essential for running a Python project as it lists the specific versions of libraries used to build and run the project. Python libraries can undergo significant changes with each update, and functions or methods may be removed in newer versions, potentially breaking a project if different versions are used.

To run the script, use the appropriate command for your operating system:

- **Windows:**
  ```shell
  .\Python\update_and_create_requirements.ps1
  ```

- **Linux and macOS:**
  ```bash
  ./Python/update_and_create_requirements.sh
  ```

## Authors

### [Álvaro Ribeiro](https://github.com/AlvaroLucioRibeiro)

Graduando do oitavo (8º) período de Engenharia de Software no Instituto Nacional de Telecomunicações (Inatel). Aprendiz Industrial em Instalação e Reparação de Redes de Computadores pelo Senai Orlando Chiarini. Já participei de uma Iniciação Científica no Laboratório de Segurança Cibernética e Internet das Coisas (CS&ILAB) com o projeto: 'Desenvolvimento Seguro de Software - Fase 01 e 02'. Atualmente estagiário do Inatel Competence Center (ICC) na área PDI SW.

### [Matheus Fonseca](https://github.com/matheusAFONSECA)

Graduando do oitavo (8º) período de Engenharia de Computação no Instituto Nacional de Telecomunicações (Inatel). Participei de uma Iniciação Científica no Laboratório de Segurança Cibernética e Internet das Coisas (CS&ILAB), onde, no projeto Park Here, desenvolvi habilidades em visão computacional aplicada a sistemas de estacionamento, focando na leitura de placas e identificação de veículos. Além disso, atuei como monitor nas disciplinas de Física 1, 2 e 3, auxiliando na condução de aulas práticas, elaboração de relatórios e esclarecimento de dúvidas teóricas. Atualmente, sou estagiário do Inatel Competence Center (ICC) na área PDI SW.
