# Sort lines 
#!/bin/bash

while read line
do
	echo "$line" >>sample.txt
done
sort sample.txt -o sample.txt

