#!/bin/bash

# Set up the interface
hciconfig hci0 up
# Make it visible to everybody
hciconfig hci0 piscan

# Run bluetoothd
bluetoothd

# Search for devices:
# bt-adapter -d

DEVICE="28:98:7B:CB:5F:35"

#Unpair the device
bt-device -r $DEVICE
# Pair with the phone
yes | bt-device -c $DEVICE

# Set up the NAP
bt-network --connect $DEVICE nap &

# Give it some time to establish the interface
sleep 2
# Ask for an IP
dhclient bnep0

# If you want your device to reconnect after reboot, sleep or device timeout, you must set the trusted property.
#bt-device --set 28:98:7B:CB:5F:35 Trusted 1


