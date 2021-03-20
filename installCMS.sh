#!/bin/bash
if [ $USER == "root" ]
then
	if [ $# == 1 ]
	then
		echo "*****Welcome to the web service and CMS installation script by BECQUAERT Remi*****"
		echo "System will be now updated and upgraded..."
		apt-get update -y > /dev/null
		echo "Update conpleted sucessfully."
		apt-get upgrade -y > /dev/null
		echo "Upgrade completed successfully."
		echo "Installing all basics for web servicing..."
		apt-get install apache2 unzip php php-xml php-mysql mysql-server -y > /dev/null
		echo "All is installed."
		echo "**********"
		if [ $1 == 'wordpress' ]
		then
			echo "Wordpress web service installing..."
           		 cd /var/www
			wget https://wordpress.org/latest.tar.gz > /dev/null
			tar -xzvf latest.tar.gz
			chown -R www-data:www-data /var/www/
			rm latest.tar.gz
			echo "**********"
			echo "Wordpress is ready, enjoy !"
			echo "To see your Wordpress website, type your IP address on the navigator."
			echo "**********"
		elif [ $1 == 'joomla' ]
		then
			echo "Create Joomla folder..."
			mkdir /var/www/joomla
           		 cd /var/www/joomla
			echo "Joomla web service installing..."
			wget -O Joomla.zip https://github.com/AFUJ/joomla-cms-fr/releases/download/3.9.25/Joomla_3.9.25-Stable-Full_Package_French_v1.zip > /dev/null
			unzip Joomla.zip > /dev/null
			chown -R www-data:www-data /var/www/
			rm Joomla.zip
			echo "**********"
			echo "Joomla is now ready, enjoy !"
			echo "To see your Joomla website, type your IP address on the navigator."
			echo "**********"
		else
			echo "Wrong parameter, choose wordpress or joomla."
		fi
	else
		echo "Write wordpress to choose it, or joomla after the script."
	fi
else
	echo "You have to be root."
fi
