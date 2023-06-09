#! /bin/bash

echo '\_SB.PCI0.LPC0.EC0.GZ44' > /proc/acpi/call
current_perf=$(cat /proc/acpi/call | tr '\0' '\n' | sed -e s/DBUS_SESSION_BUS_ADDRESS=//)

if [[ "$current_perf" == '0x0' ]]; then
	echo "Intelligent Cooling"

elif [[ "$current_perf" == '0x1' ]]; then
	echo "Extreme Performance"

elif [[ "$current_perf" == '0x2' ]]; then
	echo "Battery Saving"

fi
