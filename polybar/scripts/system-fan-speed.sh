#!/bin/bash

fan_speed=$(cat "/sys/devices/platform/coretemp.0/hwmon/hwmon3/subsystem/hwmon2/fan1_input")

echo " $fan_speed RPM"
