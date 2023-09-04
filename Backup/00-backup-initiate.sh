#!/bin/bash

#Confirm the etracs/bin path of the run.sh file
etracs_bin=etracs255-server-municipality/bin

#Get the current date
date_now=$(date +'%Y-%b-%d')

#Prompt user to confirm if all etracs clients are shutdown
echo ""
read -p "Confirm all etracs client are shutdown? [Y/N]: " input
echo ""

#Shutdown the etracs server first
if [ "$input" = "Y" ]; then
	cd
	cd $etracs_bin
	sh shutdown.sh

	cd
	cd Backup

    #Delete previous unfinished backup folder while retaining the MySQL folder
    find . ! -name 'MySQL' -type d -exec rm -rf {} +

	#Create the folder with the current date as the folder name
	mkdir -p "$date_now"
	echo ""
	echo "BACKUP FOLDER CREATED: $date_now"
	echo ""

#Exit the script when input is not 'Y'
else
	echo "Please run the script again once all users confirmed etracs client shutdown."
	echo ""
	exit 1
fi