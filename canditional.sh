# condition statement in shell scripting
#!/bin/bash
echo "This script is for conditional statement : "

if [ $1 -gt 0 ]; then 
	echo " $1 is Positive  number :) "
elif [ $1 -lt 0 ]; then 
        echo " $1 is Negative number :( "
else
	echo " $1 is Number is zero :|"
fi	
