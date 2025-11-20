# Checks Files Permissions
#!/bin/bash

if [ -r $1 ];
then
	echo "File is Readable "
fi

if [ -w $1 ];
then
        echo "File is Writeable "
fi

if [ -x $1 ];
then
       echo "File is Executable"
fi

if [ ! -r $1 ] && [ ! -w $1 ] && [ ! -x $1 ];
then
	echo "File has no permission :/"
fi


