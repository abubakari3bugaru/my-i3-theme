#!/bin/bash
export SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
#SCRIPTPATH=$(pwd)

#killing the processes if previously running
pkill polybar
pkill dunst
pkill xfce4-power-manager
killall lxqt-policykit-agent

picom --config "$SCRIPTPATH"/picom.conf &> /dev/null & 

feh --bg-fill "${SCRIPTPATH}/wallpapers/rusty-rust.jpg" &

dunst -conf "$SCRIPTPATH"/dunstrc &

lxqt-policykit-agent &

xfce4-power-manager &

cd ${SCRIPTPATH}/polybar
polybar -m | sed s/:.*// | tac | while read -r monitor
do 
  monitor=$monitor polybar -c config.ini main &> /dev/null &
done

# Dealing with sound
amixer sset Master unmute &
amixer sset Speaker unmute &
amixer sset Headphone unmute &

