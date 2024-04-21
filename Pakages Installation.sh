#!/bin/bash


USERID=$(id -u)

if [ $USERID -ne 0 ]
then
	echo "Please run the script with root"
	exit 1
else
	echo "you are super user"
fi

for i in $@
do 
	echo " packages to install $i"
done