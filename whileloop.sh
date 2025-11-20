# While loop User Case
#!/bin/bash

i=1
while [[ $i -le 20 ]] ; do
       echo "$i"
       (( i +=1 ))
done       
