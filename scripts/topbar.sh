#!/bin/bash

i3status | while :
do
  gen=''
  pck=''
  eta=''
  gen=$(sudo genlop -c -n )
  pck=$(grep \* <<< "$gen")
  cur=$(grep Currently <<< $gen)
  eta=$(grep ETA <<< $gen)
  if [[ $pck != '' ]]; then 
     echo "$cur -> ${pck:3} ${eta:7}" || exit 1
   else
     echo "" || exit 1
  fi
done
