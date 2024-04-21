#!/bin/bash


USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0|cut -d "." -f1)
LOGFILE=/tmp/$TIMESTAMP-$SCRIPT_NAME.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

echo " Script started timing at : $TIMESTAMP"

VALIDATE(){

if [ $1 -ne 0 ]
then
	echo -e"$2 is $R fail $N"
	exit 1
else
	echo "$2 is $G success $N"
fi
}
if [ $USERID -ne 0 ]
then
	echo "Please run the script with root"
	exit 1
else
	echo "you are super user"
fi

dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installing mysql"

dnf install git -y &>>$LOGFILE
VALIDATE $? "Installing git"