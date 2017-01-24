# presenterPi
Raspberry Pi powerpoint automatiation.
Based on Raspbian jessie lite with libreoffice installed.


The Raspberry pi will wait for a flashdrive with "presentation.odp" in root directory and when detected autostart libreoffice impress.
When flashdrive is removed it will shutdown libreoffice impress and go back to wait for presentation file.


You can download the complete image file and put it on your Sd-card
or you can copy the scipts to your existing image.


presenter.sh &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Main script, make it autostart on boot, put this in /home/pi/


macro &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Description for impress macro (remove 10sec delay between presentation loops)


images_galaxy.zip &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Modified waiticon.png (transparent blank image) Replace original file in /usr/share/libreoffice/share/config/


You also need to make it autorun on boot with the following commands.

nano ~/.config/lxsession/LXDE/autostart

add the following line at the bottom

@bash /home/pi/presenter.sh
