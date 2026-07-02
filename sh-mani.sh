#!/bin/bash

#the is comment
Number1=20
Number2=40
sum =$(($Number1+$Number2))
echo "sum is :$sum"
#array
movies=("powerranger" "RRR" "pushpa") #index always starts from 0
 echo "movies area :${movies[@]}"