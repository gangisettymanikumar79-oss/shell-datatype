#!/bin/bash
USERID=$(id -u)
#correct root access or not
if [ $USERID -ne 0 ]; then
 echo "please the run script with root access"

fi


