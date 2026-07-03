#!/bin/bash
USERID=$(id -u)
Log_DIR=/var/log/shell-script
Log_FILE="$Log_DIR/$0.log" #/home/ec2-user/shell-log.sh.log
#correct root access or not
if [ $USERID -ne 0 ]; then
  echo "please the run script with root access"
  exit 1

fi
## first arg -> what are you trying to install
# second arg -> exit code
validate(){
    if [ $2 -ne 0 ]; then
   echo "installing $1...........Falied" 
    exit 1
else
 echo "installing $1...........success"  
fi

}
for package in $@
do 
if [ $? -ne 0 ]; then
 echo "installing $package"
 dnf list intalling $package .........skipping
else
 dnf list intalling $package .........skipping
fi 

 
