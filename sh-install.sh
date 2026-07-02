#!/bin/bash
user=$(id -u)
#root allow otherwise exit 
if [ $user -gt 0 ]; then
 echo "please run this script with root access"
 exit 1

fi
# iam contining.......

dnf install mysql -y 
# iam still contining.......


