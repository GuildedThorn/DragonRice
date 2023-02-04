#!/bin/sh

if [ "$1" = "kali" ]; then
  sh /scripts/Kali.sh
elif [ "$1" = "nethunter" ]; then
  sh /scripts/Nethunter.sh
elif [ "$1" = "nethunter-su" ]; then
  sh /scripts/Nethunter-su.sh
elif [ "$!" = "rootless" ]; then
  sh /scripts/Nethunter-rootless.sh
else
  echo "Incorrect arguments supplied"
fi