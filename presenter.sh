#!/bin/bash

PRESENTATION=/media/pi/FLASHDRIVE/presentation.odp
USB_PRESENT=0
APP_PID=0

echo "Waiting for flashdrive with presentation.odp in root directory"

#Run loop to check if presentation.odp exist, and if so start it.
while true; do

   if [ -e "$PRESENTATION" ]; then

     echo 'Presentation detected, starting.'
     USB_PRESENT=1
     sudo rm -f ~./lock.presentation.odp
     soffice --show "$PRESENTATION" --norestore &
   #Store PID of impress so we can close it later when flashdrive is removed.
     APP_PID=$!


   fi
    
   #Run loop to check if flashdrive is still present.
     if [ $USB_PRESENT -eq "1" ]; then
	
	while [ $USB_PRESENT -eq "1"  ]; do
	   sleep 10
   #If flashdrive is removed, continue and kill impress process.
		if [ ! -e "$PRESENTATION" ]; then
		  USB_PRESENT=0
		fi
	done
	
	echo "USB drive removed, killing impress with PID $APP_PID." 
	kill $APP_PID
	echo "Waiting for flashdrive with presentation.odp in root directory"
     fi
   sleep 5

done
