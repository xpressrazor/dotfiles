#!/bin/sh
kill -9 $(pgrep -f ${BASH_SOURCE[0]} | grep -v $$)

while true
do
      waypaper --random 
      sleep 15m
done
