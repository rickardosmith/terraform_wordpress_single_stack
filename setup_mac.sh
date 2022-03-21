#!/bin/bash

###############################################################################
# Set up your local environment
###############################################################################

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install the required packages
brew install python3
brew install python3-pip
# Install AWS CLI
brew install awscli
# Install Terraform
brew tap hashicorp/tap
brew install terraform


# Setup PreCommit
pip install pre-commit
pre-commit install
