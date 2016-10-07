#!/bin/bash
USER=ubuntu

echo -e "\033[0;34m > Provisioning Vagrant server, with the following parameters:\033[0m"
echo -e "\033[0;34m > Main User:   $USER\033[0m"

# Housekeeping
echo -e "\033[0;34m > Installing system packages.\033[0m"
apt-get update
apt-get install -y git vim build-essential python3.5-dev \
  libncurses5-dev fabric postgresql-9.5 postgresql-server-dev-9.5 \
  libjpeg62-dev zlib1g-dev libfreetype6-dev

# Python environment and tools
easy_install pip==8.1.2
pip install virtualenv==15.0.3 virtualenvwrapper==4.7.2

# Postgres DB setup
echo -e "\033[0;34m > Setting up DB. If it already exists this will generate warnings, but no harm will be done.\033[0m"
sudo -u postgres psql -c "CREATE DATABASE codetest ENCODING='UTF8' TEMPLATE=template0;"
sudo -u postgres psql -c "CREATE USER ubuntu;"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE codetest TO ubuntu;"
sudo -u postgres psql -c "ALTER USER ubuntu CREATEDB;"

# do the rest as the user we'll be logging in as through SSH
chmod +x /vagrant/scripts/server-setup-user.sh
sudo -u $USER /vagrant/scripts/server-setup-user.sh

# install requirements
echo -e "\033[0;34m > Installing the pip requirements.\033[0m"
sudo -H -u $USER /home/ubuntu/.virtualenvs/code-test/bin/pip install -r /vagrant/requirements.txt
