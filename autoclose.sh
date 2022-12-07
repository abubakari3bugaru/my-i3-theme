#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"


#pkill picom 
pkill sxhkd
pkill polybar
pkill dunst
killall lxqt-policykit-agent

