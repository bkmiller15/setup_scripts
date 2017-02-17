#!/bin/bash
#
# This script provides common function for other scrips
#


#
# Installes package if not installed on Arch and Ubuntu based systems
#
helper_install_app() {

	package=$1

	# If an Arch system
	if [ -f /etc/arch-release ]; then
		if pacman -Qs $package > /dev/null ; then
			echo "The package $package is installed"
		else
			echo "The package $package is not installed"
			echo "Installing..."
			sudo pacman -S --noconfirm $package
		fi
	else  # Asume Ubuntu
		if [ ! $(which $1) ]; then
			echo "The package $package is not installed"
			echo "Installing..."
			sudo apt install $package
		else
			echo "The package $package is installed"
		fi
	fi
}

#
# Check if package is installed on system
#
helper_is_installed() {

	package=$1

	if [ ! $(which $1) ]; then
		echo "The package $package is not installed"
		exit 1
	else
		echo "The package $package is installed"
	fi
}
