#!/usr/bin/env sh

# Path to the config file
CONFIG_FILE=/home/pi/packages/PiJuice/pijuice_config.JSON

# Test to see if the config file was installed in the correct location, exit otherwise
if ! test -f "$CONFIG_FILE";
then
  echo "\e[31m$CONFIG_FILE was not found please install PiJuice repo in /home/pi/packages/PiJuice" # prints in red
  exit 1
fi

# Install pijuice-base package
apt-get install -y pijuice-base
echo "\e[34mpijuice-base has been installed, access via command line by running \"pijuice-cli\"" # prints in blue

# Navigate to the home directory exit if unable to
cd /home/pi || exit 1

# Make a copy of pijuice_config.JSON
mv /var/lib/pijuice/pijuice_config.JSON /var/lib/pijuice/pijuice_config.JSON.old
echo "\e[34mA copy of old pijuice_config.JSON has been saved as /var/lib/pijuice/pijuice_config.JSON.old" # prints in blue

# Copy our pijuice_config
cp /home/pi/packages/PiJuice/pijuice_config.JSON /var/lib/pijuice/pijuice_config.JSON

# Change owner on our pijuice_config so pijuice can access it correctly
chown pijuice /var/lib/pijuice/pijuice_config.JSON

# Change permissions on pijuice_config.JSON
chmod 777 /var/lib/pijuice/pijuice_config.JSON

# Make our Shutdown script executable
chmod +x /home/pi/packages/PiJuice/Shutdown.py

# Script executed successfully
echo "\e[32mSuccessfully installed, please reboot to ensure changes take effect" # prints in green
