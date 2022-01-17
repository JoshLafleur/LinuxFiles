#!/bin/bash

i3status | while :
do
  gen=$(sudo genlop -n -c | grep Currently)
  eta=$(sudo genlop -n -c | grep ETA)
  printf "$gen$eta" || exit 1 
done
