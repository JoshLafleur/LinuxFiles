#!/bin/bash

delim='|'
i3status | while :
do
  #gen=''
  #pck=''
  #eta=''
  out=""
  gen=$(sudo genlop -c -n )
  pck=$(grep \* <<< "$gen")
  cur=$(grep Currently <<< $gen)
  eta=$(grep ETA <<< $gen)
  if [[ $pck != '' ]]; then 
    out+="  $cur -> ${pck:3} ${eta:7}" 
  fi
  #dmsg=$(dmesg | tail -n1)
  #if [[ $out != '' ]]; then
  #  out+=" $delim"
  #fi
  #out+="  $dmsg"
  #log=$(tail -n1 /var/log/syslog)
  #if [[ $out != '' ]]; then
  #  out+=" $delim"
  #fi
  #out+="   $log"
  echo "$out" && sleep 1 || exit 1
done
