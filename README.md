# Configuring the PiJuice

To install the PiJuice and have the correct functionality please follow the steps outlined below. The process entails installing the PiJuice python package, installing the correct settings and specifying the shutdown script.

Please ensure the PiJuice is running a firmware version greater than 1.2, please refer to [the docs](https://github.com/PiSupply/PiJuice/tree/master/Firmware) on updating the firmware.

## Automated Installation
You can automate the entire install process by running the install script from this directory, ```sudo sh ./install.sh``` followed
by a reboot of the Pi to ensure the changes take effect

## Manual Installation
If you wish to manually go through the installation process please follow the outlined steps below.

### Install PiJuice dependencies 
We will install the command line version of PiJuice by running ```sudo apt-get install pijuice-base```

Make sure you have this repository cloned into the directory `````/home/pi/packages/PiJuice`````. This is necessary as the user script is defined to be run in this location

### Install JSON Settings File
Run all of the following commands from the home directory (/home/pi) with sudo

* We need to copy our pijuice settings file to the pi do this by first making a backup of the current settings: ```sudo mv /var/lib/pijuice/pijuice_config.JSON /var/lib/pijuice/pijuice_config.JSON.old```
* Now copy the new settings in  ```sudo cp /home/pi/packages/PiJuice/pijuice_config.JSON /var/lib/pijuice/pijuice_config.JSON```

* Change the permissions so pijuice can read the file ```sudo chown pijuice /var/lib/pijuice/pijuice_config.JSON``` and ```sudo chmod 777 /var/lib/pijuice/pijuice_config.JSON```


### Make Shutdown.py Executable
The Shutdown.py in this repository is responsible for shutting the pi down. Please leave the this file in /home/pi/packages/PiJuice/
as the settings file looks Shutdown.py in that file path. 

The file needs to be executable so run ```chmod +x /home/pi/packages/PiJuice/Shutdown.py```

### Reboot
Reboot the Pi to ensure the settings take effect.

## Debugging
**PiJuice running firmware version 1.2 has proven to not work nicely with our intended use case. Please ensure the PiJuice is running a firmware version greater than 1.2!** Please refer to [the docs](https://github.com/PiSupply/PiJuice/tree/master/Firmware) on updating the firmware.

The PiJuice service needs to be running in order for the PiJuice to function correctly. To ensure the service is running run ```systemctl status pijuice.service```

Shutdown.py was modeled off this [github issue answer](https://github.com/PiSupply/PiJuice/issues/159) as well as [this github answer.](https://github.com/PiSupply/PiJuice/issues/309)

You can access the pijuice installed package and change settings accordingly by running ```pijuice-cli```
