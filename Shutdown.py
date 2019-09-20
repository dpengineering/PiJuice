#!/usr/bin/env python3

import os
from pijuice import PiJuice

pj = PiJuice(bus=1, address=0x14)

pj.status.SetLedBlink(led='D2', count=3, rgb1=[0, 0, 200], ssperiod1=1000, rgb2=[200, 0, 0], period2=1000)

# Remove power to PiJuice MCU IO pins
pj.power.SetSystemPowerSwitch(0)

# Remove 5V power to RPi after 60 seconds
# Wait for the timer to finish before restarting the board
pj.power.SetPowerOff(delay=60)

# Shut down the RPi
os.system('sudo shutdown now')
