#!/bin/bash

# Calcola la capacità rimanente della batteria"


if [ -d "$BAT0" ]
then
	str=`cat /proc/acpi/battery/BAT0/state | grep "remaining"`
	full_capacity=`cat /proc/acpi/battery/BAT0/info | grep "full"`

else
	str=`cat /proc/acpi/battery/BAT1/state | grep "remaining"`
	full_capacity=`cat /proc/acpi/battery/BAT1/info | grep "full"`
fi


x=${str:25:4}						       # Sottostringa di str
y=${full_capacity:25:4}

a=100							
full=($y * 1)
remaining_capacity=($x * 1)				       # Da stringa a int

      
capacity=`echo "scale=2;($a * $remaining_capacity)/$full" | bc`

let  "warning=($full*10)/100"

if  [ "$remaining_capacity" -le  "$warning" ]
then
	
	echo "Low Battery, please connect the AC."

fi


#echo "Remaining Capacity: " $capacity"%"

