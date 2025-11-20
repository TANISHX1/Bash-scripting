# Checks the Triangle type
#!/bin/bash

read x
read y
read z
 if [ $(("$x" + "$y" )) -gt "$z" ] || [ $(("$y" + "$z" )) -gt "$x" ] ||[ $(("$x" + "$z" )) -gt "$y" ]; then 
 if [ "$x" -ge 1 ] && [ "$x" -le 1000 ] && [ "$y" -ge 1 ] && [ "$y" -le 1000 ] && [ "$z" -ge 1 ] && [ "$z" -le 1000 ] ; then
   if [ "$x" -eq "$y" ] && [ "$x" -eq "$z" ];then
        echo "EQUILATERAL"
  
 elif [ "$x" -eq "$y" ] || [ "$x" -eq "$z" ] || [ "$z" -eq "$y" ]; then
     echo "ISOSCELES"
 else
     echo "SCALENE"         
 fi 
 fi
 fi
