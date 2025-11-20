# array
#!/bin/bash
 
for i in {1..3}
do
	array[i]=$1
done
echo ${array[2]}

