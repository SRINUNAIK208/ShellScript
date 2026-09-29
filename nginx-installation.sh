#!/bin/bash 

USERID=$(id -u)
if [ $USERID -eq 0 ]
then
  echo "user has root access..sucess"
else
  echo "ERROR: permission denied..switch to root access"
  exit 1
fi 

dnf list installed nginx

if [ $? -eq 0 ]
then
  echo "nginx already installed"
else
  echo "nginx not installed...goin to install"
    dnf install nginx -y 
    if [ $? -eq 0 ]
    then
       echo "nginx installation... success" 
    else 
       echo "nginx installation...failed"
       exit 1
    fi 

fi
