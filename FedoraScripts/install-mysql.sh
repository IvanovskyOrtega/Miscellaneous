#!/bin/bash

## A basic MySQL installation script for Fedora 29 based on If not true then false blog
## https://www.if-not-true-then-false.com/2010/install-mysql-on-fedora-centos-red-hat-rhel/

green="\033[0;32m"
red="\033[0;32m"
orange="\033[0;33m"
blue="\033[0;34m"
nc="\033[0m"

printf "${red}Installing MySQL...${nc}\n"

## Install MySQL with dnf
dnf install https://dev.mysql.com/get/mysql80-community-release-fc29-1.noarch.rpm -y
dnf install mysql-community-server -y

## Uncomment if want to update/install MySQL 5.7.24
#dnf --disablerepo=mysql80-community --enablerepo=mysql57-community install mysql-community-server

## Start MySQL service
systemctl start mysqld.service # Use restart after update

## Uncomment to enable MySQL service
#systemctl enable mysqld.service

## Get the randomly generated password
genpassword=$(grep 'A temporary password is generated for root@localhost' /var/log/mysqld.log |tail -1)
readarray -td " " a <<< "$genpassword"
genpassword=${a[-1]}
printf "${green}This is your random password:${nc} %s" "$genpassword"
printf "${orange}Saving password to file...${nc}\n"
echo $genpassword > mysqlpass.txt
printf "Password saved to ${green}mysqlpass.txt${nc}\n"
printf "You can change it by executing ${blue}/usr/bin/mysql_secure_installation${nc} as ${red}root${nc}\n"

## Installation OK (hoping everything has gone right...)
printf "${green}Installation finished${nc}\n"
