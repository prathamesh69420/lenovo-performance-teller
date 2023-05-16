#! /bin/bash

echo '\_SB.PCI0.LPC0.EC0.GZ44' > /proc/acpi/call
current_perf=$(cat /proc/acpi/call | tr '\0' '\n' | sed -e s/DBUS_SESSION_BUS_ADDRESS=//)

if [[ "$current_perf" == '0x0' ]]; then
	echo "Intelligent Cooling"
	sudo -u knight DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u knight)/bus notify-send "Intelligent Cooling" "Balance is essential in life"

elif [[ "$current_perf" == '0x1' ]]; then
	echo "Extreme Performance"
	sudo -u knight DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u knight)/bus notify-send "Extreme Performance" "Gaming, huh?"

elif [[ "$current_perf" == '0x2' ]]; then
	echo "Battery Saving"
	sudo -u knight DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u knight)/bus notify-send "Battery Saving" "Save Battery, Save Lives"

fi
