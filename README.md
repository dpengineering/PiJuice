# PiJuice

To get PiJuice installed, run this command in Termit:

sudo apt-get install pijuice-gui

Next, open up PiJuice Settings. It can be found in the Start Menu under prefrences. It should open a window similar to Picture1 in screenshots.

On the HAT tab click "Configure hat".
Make sure the "GPIO Input Enabled" and the "Charging Enabled" boxes are checked.

Go to the System Task tab and check the box next to "System task enabled"

Go to the System Events tab and click the "No Power" event box and use the dropdown menu to select 'USER_FUNC1' like Picture2 in screenshots

Next, head over to the 'User Scripts' section and use the '...' button to select the path to Shutdown.py for 'USER_FUNC1'. 

Finally we need to run a command to copy the pijuice.py python package to the pyhton3 packages. otherwise our shutdown script will not run.

NOTE: This must be run from the root directory not the pi directory. so when you open up termit type ```cd ../../```

```
sudo cp /usr/lib/python2.7/dist-packages/pijuice.py /usr/lib/python3/dist-packages/pijuice.py
```

When the battery is unplugged from a power source, the LEDs on pin D2 should blink red and blue, signifying the beginning of the shutdown process. The Raspberry Pi will then turn off, and 20 seconds later, the battery will turn off as well. These numbers are adjustable in the code(See Shutdown.py).


When hooking up the PiJuice to a project plug the power supply into the raspberry pi. This will ensure that the pi boots when it receives power. If the Power is plugged into the piJuice it will require a button to be pressed to boot the PI. 
