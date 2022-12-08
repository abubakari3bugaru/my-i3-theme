#!/bin/bash
export SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
#SCRIPTPATH=$(pwd)

#killing the processes if previously running
pkill sxhkd
pkill polybar
pkill dunst
killall lxqt-policykit-agent

picom --config "$SCRIPTPATH"/picom.conf &> /dev/null & 

feh --bg-scale "${SCRIPTPATH}/wallpapers/astronaut-playing-guitar.jpg" &

dunst -conf "$SCRIPTPATH"/dunstrc &

lxqt-policykit-agent &

cd ${SCRIPTPATH}/polybar
polybar -m | sed s/:.*// | tac | while read -r monitor
do 
  monitor=$monitor polybar -c config.ini main &> /dev/null &
done

# Dealing with sound
amixer sset Master unmute &
amixer sset Speaker unmute &
amixer sset Headphone unmute &

sxhkd -c "$SCRIPTPATH"/sxhkdrc &
