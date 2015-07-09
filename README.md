am2301

Kernel module for AM2301 (DHT21) temperature/relative humidity sensor.

This is a driver for Raspberry PI.
It uses GPIO24 as default, GPIO is configurable as module parameter (gpio).

The driver uses procfs interface (/proc/am2301), 
reporting T, RH and read status [OK/error, checksum/error, no data]

# am2301
# am2301
