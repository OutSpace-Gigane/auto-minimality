#!/bin/bash

# i'm kind of beginner coder but i'm sure about no one will know about those
echo -e "\e[1;95mWelcome to the our Auto Package Installer and Manager for Arch Linux!\e[0m"
echo -e "\e[1;101m\e[1;96mThis works on Arch Linux, More Versions might come soon. \e[0m"
echo
echo

# Which one do you want to do?
echo "Choose Your Operation"
echo -e "\e[1;32m[1] - Install Packages \e[0m"
echo -e "\e[1;31m[2] - Remove Packages \e[0m"
echo -e "\e[1;33m[3] - System Upgrade with Pacman"
read op

if [[ $op = "3" ]]; then
  sudo pacman -Syu
  exit 1
fi

# Choosing and Fetching Package Manager
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
  exit 1
fi

# installs Packages
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
fi

if [[ $op = "2" ]]; then
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
fi
