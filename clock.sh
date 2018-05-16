#!/bin/bash
stopwatch(){
	read -p "Press *Enter* to start stop watch"
	local sec=0;min=0;hour=0;
	while [ True ];do
		clear
		echo $hour:$min:$sec
		((sec++))
		sleep 1
		if [ $sec == 60 ];then
			((min++))
			sec=0
		fi
		if [ $min == 60 ];then
			((hour++))
			min=0	
		fi
	done
}
timer(){
	read -p "Enter desire time in minute : " timer
	echo "Timer sets for $timer minute from now"
	timer=$((timer*60))
	sleep "$timer" 
	notify-send "Timer end"
	play definite.ogg
}
alarm(){
	read -p "Enter alarm time in HH:MM:SS format : " alarm
	clear
	echo "Alarm set for $alarm. Now it's `date +%T`."
	now=`date +%T`
	while [ True ];do
		if [ "$alarm" == "$now" ];then 
			notify-send "`date +%T` Alarm"
			play definite.ogg
			break	
		fi
		now=`date +%T`
	done
}
echo -e "1-Alarm\n2-Stopwatch\n3-Timer"
read -p "Chose program mode:" mode
case "$mode" in 
	"1")
		alarm
	;;
	"2")
	stopwatch
	;;
	"3")
		timer
	;;
esac
