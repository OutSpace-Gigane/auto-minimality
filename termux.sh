#!/bin/bash

# intro
cat "ascii/logo.txt"

echo -e "\e[1;95mWelcome to our Auto Package Installer and Manager for Termux (It may work on FreeBSD too!) \e[0m"
echo -e "\e1;101m\e1;96mAuto-Minimality is on your service now!"
echo
echo

# looping
while [[ 1 == 1 ]]; do

	# Operation choosing
	echo "Choose your Operation"
	echo -e "\e[1;32m[1] - Install Packages \e[0m"
	echo -e "\e[1;31m[2] - Remove Packages \e[0m"
	echo -e "\e[1;33m[3] - Update and Upgrade. \e[0m"
	echo "CTRL + C to exit from script"
	read op

	# third option should be written first
	if [[ $op = "3" ]]; then
		pkg update && pkg upgrade
	fi

	# first option to install Packages
	if [[ $op = "1" ]]; then
		echo -e "\e[1;32m Enter Packages that you want to Install here: "
		read PKGINS

		pkg install $PKGINS
	fi

	# second option to remove Packages.
	if [[ $op = "2" ]]; then
		echo -e "\e[1;31m Warning: It may contain something you needed. It just deletes Packages. Run the script again and choose '1' to install Packages"
		echo -e "Which Packages do you want to remove?"
		read PKGRM

		pkg uninstall $PKGRM
	fi

	# for invaild commands
	if [[ $op != "1" || "2" || "3" ]]; then
		echo "Command not found. Try again"
	fi
done
