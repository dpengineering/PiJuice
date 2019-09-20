# Configuring the PiJuice

To install the PiJuice and have the correct functionality please follow the steps outlined below. The process entails installing the PiJuice 
python package, installing the correct settings and specifying the shutdown script.

## Install PiJuice dependencies 
We will install the command line version of PiJuice by running ```sudo apt-get install pijuice-base```

Make sure you have this repository cloned into the directory /home/pi/PiJuice. This is necessary as the user script is defined to be run in this location

## Install Setting JSON File
We need to copy our pijuice settings file to the pi do this by first making a backup of the current settings: ```sudo mv /var/lib/pijuice/pijuice_config.JSON /var/lib/lib/pijuice/pijuice_config.JSON.old```
Now copy the new settings in ```sudo cp (path to cloned pijuice_config.json) /var/lib/pijuice/pijuice_config.JSON```
Change the permissions so pijuice can read the file ```chown pijuice /var/lib/pijuice/pijuice_config.JSON```

## Make Shutdown.py Executable
The Shutdown.py in this repository is responsible for shutting the pi down. Please leave the this file in /home/pi/packages/PiJuice/
as the settings file looks Shutdown.py in that file path. 

The file needs to be executable so run ```chmod +x /home/pi/PiJuice/Shutdown.py```