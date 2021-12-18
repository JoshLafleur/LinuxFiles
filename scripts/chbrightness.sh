#!/bin/bash
#uses input, first parameter = the change
#needs to be added to sudoers as ALL ALL=(ALL) NOPASSWD: ...path.../chbrightness.sh

curbri=$(</sys/class/backlight/amdgpu_bl0/brightness)
ch=$1
newbri=$((ch + curbri))
echo $newbri > /sys/class/backlight/amdgpu_bl0/brightness
