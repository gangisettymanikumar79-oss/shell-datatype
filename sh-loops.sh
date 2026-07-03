#!/bin/bash
USERID=$(id -u)
Log_DIR=/var/log/shell-script
Log_FILE="$Log_DIR/$0.log"

if [ $USERID -ne 0 ]; then
  echo "please run the script with root access"
  exit 1
fi

validate(){
    if [ $2 -ne 0 ]; then
        echo "installing $1...........Failed"
        exit 1
    else
        echo "installing $1...........success"
    fi
}

for package in "$@"
do
    echo "checking $package"
    dnf list installed "$package" &>> $Log_FILE
    if [ $? -ne 0 ]; then
        echo "installing $package"
        dnf install "$package" -y &>> $Log_FILE
        validate "$package" $?
    else
        echo "$package is already installed...........skipping"
    fi
done
