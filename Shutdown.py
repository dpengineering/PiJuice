#!/usr/bin/env python

import os
from pijuice import PiJuice
import logging
from subprocess import call
import time

pj = PiJuice(1, 0x14)


pj.status.SetLedBlink('D2',3, [0,0,200],1000, [200,0,0], 1000)

#Wait before beginning shutdown process(8 seconds)
time.sleep(8)
# Remove power to PiJuice MCU IO pins
pj.power.SetSystemPowerSwitch(0)
# Remove 5V power to RPi after 20 seconds
#Wait for the timer to finish before restarting the board
pj.power.SetPowerOff(20)
# Shut down the RPi
call("sudo shutdown -h now", shell=True)
