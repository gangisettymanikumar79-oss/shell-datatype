#!/bin/bash
USERID=$(id -u)
Log_DIR=/var/log/shell-script
Log_FILE="$Log_DIR/$0.log"
timestmp=$(date "+%y-%m-%d %H:%M:%S")
Black=\e[30m
Green=\e[32m
Yellow=\e[33m
Blue=\e[34m

if [ $USERID -ne 0 ]; then
  echo "please run the script with root access"
  exit 1
fi

validate(){
    if [ $2 -ne 0 ]; then
        echo "$timestmp [ERROR] installing $1 is ...........$B Failed $N "
        exit 1
    else
        echo "$timestmp [INFO] installing $1 is ...........$G success $N"
    fi
}

for package in "$@"
do
    echo "$timestmp [ERROR] checking $package"
    dnf list installed "$package" &>> $Log_FILE
    if [ $? -ne 0 ]; then
        echo "$timestmp installing $package"
        dnf install "$package" -y &>> $Log_FILE
        validate "$package" $?
    else
        echo "$timestmp [INFO] $package is already installed...........$y skipping $N"
    fi
done
