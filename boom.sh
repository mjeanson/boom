#!/bin/sh

while true; do
	echo "Looping..."
	insmod ./boom.ko
	sleep 0.5
	rmmod boom
done
