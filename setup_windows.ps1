#Requires -RunAsAdministrator

<#
.DESCRIPTION
   Provision developers environment installing the required packages for this project.
.AUTHOR
    Rickardo Smith <rickardo.smith@gmail.com>
.EXAMPLE
   .\setup.ps1
#>

# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; 
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))


# Install packages
choco install -y terraform awscli

# Install Project specific packages
choco install -y tflint terraform-docs tfsec

# Install Python
# Install pip as well as part of the Python installation
# Download and install Python from https://www.python.org/downloads/


# Install Python packages
pip install pre-commit
pre-commit install
