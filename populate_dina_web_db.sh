#!/bin/bash

echo "Getting sample data from github"
wget https://github.com/DINA-Web/datasets/raw/master/specify/DemoDatawImages.sql.gz
gunzip DemoDatawImages.sql.gz
mv DemoDatawImages.sql mysql-autoload

echo "Loading sample data into dina-mysql container"
docker-compose stop dina-mysql
docker-compose start dina-mysql
sleep 5
docker exec -i dwcollections_dina-mysql_1 mysql -u root -ppassword12 -e "create database dina_web;"
docker exec -i dwcollections_dina-mysql_1 mysql -u root -ppassword12 -D dina_web < mysql-autoload/DemoDatawImages.sql

echo "Removing sample data"
rm mysql-autoload/DemoDatawImages.sql

echo "Please run docker-compose up now"
