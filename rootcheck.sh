# Checks Specifice Process is in Root or Not
#!/bin/bash
echo "User ID : "$UID
if [ "$UID" -eq 0 ]
then
	echo " Root user "
else
	echo " Not -root user"
fi
