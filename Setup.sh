#!/bin/bash

COMPONENT=postgresql

echo -n " Setting Up the Repo"
sudo yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm 

echo -n " Installing $COMPONENT "
sudo yum install -y postgresql15-server 

echo -n " Optionally initialize the database and enable automatic start "
sudo /usr/pgsql-15/bin/postgresql-15-setup initdb
sudo systemctl enable postgresql-15
sudo systemctl start postgresql-15