#!/bin/bash
USERID=$(id -u)
#correct root access or not
if [ $USERID -ne 0 ]; then
 echo "please the run script with root access"
 exit 1

fi
 #echo " i am contiting....."
 echo "installing mysql"
 dnf install mysqlhdijsadfh -y
if [ $? -ne 0 ]; then
 echo "installing mysql...........Falied"
exit 1
else
 echo "installing mysql...........success"
fi
 


