#!/bin/bash

echo "create database"
mariadb -u root -proot123 -e "create database IF NOT EXISTS wordpress;"

