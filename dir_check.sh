# Greatest Among three
#!/bin/bash

echo  "Greatest of three :"
echo  "Numbers : $1, $2, $3"
if [ $1 -gt $2 ] && [ $1 -gt $3 ];
then
	echo "$1 is greater among three "
fi

if [ $2 -gt $1 ] && [ $2 -gt $3 ];
then
	echo "$2 is greater among three "
fi

if [ $3 -gt $1 ] && [ $3 -gt $2 ];
then 
	echo "$3 is greater among three "
fi
