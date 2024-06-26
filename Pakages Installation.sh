#!/bin/bash


USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0|cut -d "." -f1)
LOGFILE=/tmp/$TIMESTAMP-$SCRIPT_NAME.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[30m"

VALIDATE(){

if [ $1 -ne 0 ]
then
	echo -e " $R $2 is fail $N"
	exit 1
else
	echo -e " $G $2 is success $N"
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
if [ $? -eq 0 ]
then
	echo -e "$i already installed ... $Y Skipping ..$N"
else
	dnf install $i -y &>>LOGFILE
fi
done