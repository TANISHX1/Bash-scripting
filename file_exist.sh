# Checks File Existence in Current Directory 
#!/bin/bash

echo "Enter the file name : "
read filename

if [ -e "$filename" ]
then
	echo "File exists in current directory  "
else
	echo "File doesn't exist in current directory "
fi
