#!/bin/bash

#Get the current date
date_now=$(date +'%Y-%b-%d')

#Maximum backup files in MySQL folder
max_files=1

#Maintaining 1 compressed files in the folder by removing the oldest and creating the newest
cd MySQL
while [ "$(ls -1 | wc -l)" -ge "$max_files" ]; do
     oldest_file=$(ls -1tr | head -1)
     rm "$oldest_file"
done
cd ..

#Compress the backup files then finish the backup process by moving the file to MySQL folder
echo ""
echo "COMPRESSING FILES"
tar -czvf "$date_now.tar.gz" $date_now
mv "$date_now.tar.gz" ~/Backup/MySQL
echo ""
echo "MYSQL BACKUP COMPLETED"
echo ""

#Delete the uncompressed backup folder
rm -rf $date_now



