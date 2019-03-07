#!/bin/bash
set -e
service mysql start
chown mysql:mysql -R /var/lib/mysql/*
chmod 755 -R /var/lib/mysql/*
mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES;"
mysql -u root -proot < /tmp/data.sql
