#!/bin/bash
# VirtualEnv and Django setup

USER=ubuntu

# This is a distinct file as it's meant to be run as the primary user we SSH in as
echo -e "\033[0;34m > Running main-user setup script, with the following parameters:\033[0m"
echo -e "\033[0;34m > Main User:   $USER\033[0m"

# Set up virtualenv directory for the user if required
if [ ! -d /home/$USER/.virtualenvs ]; then
    echo -e "\033[0;31m > Creating .virtualenvs folder"
    mkdir /home/$USER/.virtualenvs
fi

# write all the profile stuff for the user if required
grep -q virtualenvs /home/$USER/.bashrc
if [ $? -ne 0 ]; then
    echo -e "\033[0;31m > Updating profile file\033[0m"
    echo "source ~/.virtualenvs/code-test/bin/activate" >> /home/$USER/.bashrc
    echo "cd /vagrant/" >> /home/$USER/.bashrc
fi

echo -e "\033[0;34m > Setting up virtualenv\033[0m"
export WORKON_HOME=/home/$USER/.virtualenvs
export PIP_VIRTUALENV_BASE=/home/$USER/.virtualenvs
python3 -m venv $PIP_VIRTUALENV_BASE/code-test
source $PIP_VIRTUALENV_BASE/code-test/bin/activate

# install requirements
echo -e "\033[0;34m > Installing the pip requirements.\033[0m"
$PIP_VIRTUALENV_BASE/code-test/bin/pip install -U pip
$PIP_VIRTUALENV_BASE/code-test/bin/pip install wheel==0.29.0
$PIP_VIRTUALENV_BASE/code-test/bin/pip install -r /vagrant/requirements.txt
