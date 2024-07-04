#!/bin/bash

#Define variables for colors
red='\033[0;31m'
green='\033[0;32m' 

#Get Input For Resource Group
read -p "Enter Resource Group Name: " resource_group
read -p "Enter Resource Group Location (eg. westus3): " location
echo -e "${red}Processing...please login to Azure"
sleep 3

#Logon to Azure
az login
echo -e "${red}Thank you. Creating $resource_group in $location..."

#Check if Resource Group Exists - Create If It Does Not
if az group show --name "$resource_group" &> /dev/null
then 
echo -e "${red}INVALID: This Resource Group Already Exists!"

else
az group create --name "$resource_group" --location "$location"
echo -e "${green}$resource_group has been successfully created in $location"
fi
