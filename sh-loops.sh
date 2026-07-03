#!/bin/bash
set -e
USERID=$(id -u)
Log_DIR=/var/log/shell-script
Log_FILE="$Log_DIR/$0.log"
timestmp=$(date "+%y-%m-%d %H:%M:%S")

Black='\e[30m'
Red='\e[31m'
Green='\e[32m'
Yellow='\e[33m'
Blue='\e[34m'
NC='\e[0m'   # No Color / reset

trap 'echo "error at $LINENO", command: $BASH_COMMAND"' ERR

if [ $USERID -ne 0 ]; then
  echo "please run the script with root access"
  exit 1
fi

validate(){
    if [ $2 -ne 0 ]; then
        echo -e "$timestmp [ERROR] installing $1 is ...........${Red}Failed${NC}" | tee -a $Log_FILE
        exit 1
    else
        echo -e "$timestmp [INFO] installing $1 is ...........${Green}success${NC}" | tee -a $Log_FILE
    fi
}

for package in "$@"
do
    echo "$timestmp [INFO] checking $package"
    dnf list installed "$package" &>> $Log_FILE
    if [ $? -ne 0 ]; then
        echo "$timestmp installing $package"
        dnf install "$package" -y &>> $Log_FILE
        
    else
        echo -e "$timestmp [INFO] $package is already installed...........${Yellow}skipping${NC}"
    fi
done
