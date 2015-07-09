#!/bin/sh

ok_count=0
error_count=0

# This is a your personal key for thingspeak channel
CHANNEL_KEY=ABCDEFGHIJKLMNOPQ

while (true) 
do 
   data=$(cat /proc/am2301)
   t=$(echo $data | /usr/bin/awk '{ print $3 }')
   rh=$(echo $data | /usr/bin/awk '{ print $1 }')
   ok=$(echo $data | /usr/bin/awk '{ print $5 }')
   cputemp=$(cat /sys/class/thermal/thermal_zone0/temp | awk '{ print $1 /1000 }')

   if [ "$ok" = "ok" ] 
      then
         ok_count=$(($ok_count+1))
         /usr/bin/wget "https://api.thingspeak.com/update?key=${CHANNEL_KEY}&field1=$t&field2=$rh&field3=$ok_count&field4=$error_count&field5=$cputemp" -O - > /dev/null
      else 
         error_count=$(($error_count+1))
   fi

done

