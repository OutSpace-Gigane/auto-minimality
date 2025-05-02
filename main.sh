#!/bin/bash

PackMgr=0

cat "ascii/logo.txt"

# Intro / Starting
echo -e "\e[1;95mWelcome to the our Auto Package Installer and Manager for Arch Linux!\e[0m"
echo -e "\e[1;101m\e[1;96mAuto-Minimality is on Your Service \e[0m"
echo
echo

# Loops from v0.3 so you don't have to do restart the screen over again
while [[ 1 == 1 ]]; do

	# Which one do you want to do?
	echo "Choose Your Operation"
	echo -e "\e[1;32m[1] - Install Packages \e[0m"
	echo -e "\e[1;31m[2] - Remove Packages \e[0m"
	echo -e "\e[1;33m[3] - System Upgrade with Pacman \e[0m"
	echo "CTRL + C to Exit from script"
	read op

	# if third option then System Update / Upgrade
	if [[ $op = "3" ]]; then
		sudo pacman -Syu
	fi

	# Choosing and Fetching Package Manager for options 1 and 2 and yeah with loops!
	while [[ $PackMgr = 0 ]]; do
		echo -e "\e[1;32m Which Package Manager Do you choose? \e[0m"
		echo "[1] - pacman (Default)"
		echo "[2] - yay (by Jguer)"
		echo "[3] - Flatpak"
		read PackMgr
		if [[ $PackMgr = "1" ]]; then
			echo "Choosed: Pacman"
		elif [[ $PackMgr = "2" ]]; then
			echo "Choosed: yay"
		elif [[ $PackMgr = "3" ]]; then
			echo "Choosed: Flatpak"
		else
			echo "Command not found Try Again"
		fi
	done

	# (OPTION 1) installs Packages

	if [[ $op = "1" ]]; then
		echo -e "\e[1;33mNow choose your Packages to install!"
		read NewPackages

		if [[ $PackMgr = "1" ]]; then
			sudo pacman -S $NewPackages
		elif [[ $PackMgr = "2" ]]; then
			yay -S $NewPackages
		elif [[ $PackMgr = "3" ]]; then
			flatpak install $NewPackages
		fi

		#(OPTION 2) removes PKGs
	elif [[ $op = "2" ]]; then
		echo -e "\e[1;31mWARNING, it may contain something you needed. it just deletes packages, if you want to Install Anything run the script again and select the first option"
		echo -e "Which packages do you want to remove?"
		read RMPKG

		if [[ $PackMgr = "1" ]]; then
			sudo pacman -R $RMPKG
		elif [[ $PackMgr = "2" ]]; then
			yay -R $RMPKG
		elif [[ $PackMgr = "3" ]]; then
			flatpak uninstall $RMPKG
		fi
	else
		echo "Wrong Command try again."
	fi
done
