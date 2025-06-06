#!/bin/bash
# this version should be work on Debian / apt like Linux distro(s)

cat "ascii/logo.txt"

# Setting up Intro
echo -e "\e[1;95mWelcome to the our Auto Package and Manager for Debian (and based) distros"
echo -e "\e[1;101m\e[1;96mThis works on Debian Based Distros, Arch verison script should be named 'main.sh' \e[0m"
echo
echo

while [[ 1 == 1 ]]; do

	# choosing an operation.
	echo "Choose your Operation"
	echo -e "\e[1;32m  [1] - Install Packages via apt"
	echo -e "\e[1;31m  [2] - Remove Packages"
	echo -e "\e[1;33m  [3] - System Update and Upgrade \e[0m"
	echo "CTRL + C to exit from the script"
	read op

	if [[ $op = "3" ]]; then
		sudo apt update && sudo apt upgrade
		exit 1

	# package installing section

	elif [[ $op = "1" ]]; then
		echo -e "\e[1;33mChoose the Packages you want \e[0m"
		read NewPackages

		sudo apt install $NewPackages

	elif [[ $op = "2" ]]; then
		echo -e "\e[1;31mWARNING: it may contain something you needed. it just deletes packages if you want to install anything, Run the script again and select the first option."
		echo -e "Which Packages do you want to remove?"
		read RMPKG

		sudo apt remove $RMPKG

	else
		echo "Wrong command try again"
	fi
done
