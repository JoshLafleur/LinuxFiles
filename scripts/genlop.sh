#!/bin/bash

input=
while [[ $input != "q" ]]; do
  echo $input
  clear
  sudo genlop -c -i
  read -s -n 1 -t 5 -p "Enter q to quit: " input
  echo 
done
