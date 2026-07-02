#!/bin/bash
USERID=$(id -u)
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
 #echo " i am contiting....."
   dnf list installed mysql
if [$? -eq 0]; then
   echo "mysql is already installed..........skipping"
else
   echo "installing mysql"
   dnf install mysql -y
   validate mysql $?
fi
dnf list installed nginx
if [$? -eq 0]; then
   echo "nginx is already installed..........skipping"
else
   echo "installing nginx"
   dnf install nginx -y
   VALIDATE nginx $?

fi
 


