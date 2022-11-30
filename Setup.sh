#!/bin/bash
set -e

LOGFILE=/tmp/$COMPONENT.log

COMPONENT=postgresql

source  postgresql/common.sh

if [ $USER_ID -ne 0 ]; then
    echo -e "\e[31m You must execute as a Root User\e[0m"
    exit 1
fi

echo -n " Setting Up the Repo"
sudo yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm &>> $LOGFILE
stat $?

echo -n " Installing $COMPONENT "
sudo yum install -y postgresql15-server &>> $LOGFILE
stat $?

echo -n " Optionally initialize the database and enable automatic start "
sudo /usr/pgsql-15/bin/postgresql-15-setup initdb
sudo systemctl enable postgresql-15
sudo systemctl start postgresql-15
stat $?