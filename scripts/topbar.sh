#!/bin/bash

i3status | while :
do
  pck=$( sudo genlop -n -c | grep \*)
  gen=$(sudo genlop -n -c | grep Currently)
  eta=$(sudo genlop -n -c | grep ETA)
  printf "$gen -> ${pck:3} ${eta:6}" || exit 1 
done
