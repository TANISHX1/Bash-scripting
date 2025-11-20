# Use Case of Switch (switch is a function Existes in C lang.)
#!/bin/bash

fruit="mango"

case $fruit in
	"apple")
		echo "This is red fruit."
		;;
	"banana")
		echo "This is yellow fruit."
		;;
	"mango")
	 	echo "This is yelloish-green fruit."
		;;
	"watermelon")
		echo "This is green fruit. "
		;;
	*)
		echo "No fruit entered. "
		;;
esac
