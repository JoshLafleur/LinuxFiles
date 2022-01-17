#!/bin/bash

i3status | while :
do
  gen=$(sudo genlop -c -n )
  pck=$(grep \* <<< "$gen")
  cur=$(grep Currently <<< $gen)
  eta=$(grep ETA <<< $gen)
  if [ $pck != "" ]; then 
    printf "$cur -> ${pck:3} ${eta:7}" || exit 1 
  fi
done
