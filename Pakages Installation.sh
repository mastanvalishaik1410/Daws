#!/bin/bash


USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0|cut -d "." -f1)
LOGFILE=/tmp/$TIMESTAMP-$SCRIPT_NAME.log

VALIDATE(){

if [ $1 -ne 0 ]
then
	echo"$2 is fail"
	exit 1
else
	echo "$2 is success"
fi
}


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
	dnf list installed $i &>>$LOGFILE
if [ @? -eq 0]
then
	echo "$i already installed ...Skipping"
fi
done