#!/bin/bash
echo "******************************************"
echo "Configuring Ethernet-over-USB in Erle"
echo "******************************************"

ifconfig usb0 192.168.1.2
route add default gw 192.168.1.1

# Now in the Host Computer:

# Ubuntu:

# iptables --table nat --append POSTROUTING --out-interface wlan0 -j MASQUERADE
# iptables --append FORWARD --in-interface usb0 -j ACCEPT
# echo 1 > /proc/sys/net/ipv4/ip_forward

# Mac OS:

## en1 the interface connected to the internet
## en0 the interface connected to Erle

# sudo ifconfig en6 192.168.1.1
# sudo sysctl -w net.inet.ip.forwarding=1
# sudo natd -interface en1 -v yes
# sudo ipfw flush
# sudo ipfw add divert natd all from any to any via en1
# sudo ipfw add divert natd all from any to any via en0
# sudo ipfw add 65535 allow all from any to any
