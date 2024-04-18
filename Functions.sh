#!/bin/bash


USERID=$(id -u)

VALIDATE(){
	if[ $1 -ne 0]
	then
		echo "$2 is fail"
	else
		echo " $2 is sucess"
}
if [ $USERID -ne 0 ]
then
	echo "Please run the script with root"
	exit 1
else
	echo "you are super user"
fi

dnf install mysql -y
VALIDATE $? "Installing mysql"

dnf install git -y
VALIDATE $? "Installing git"
