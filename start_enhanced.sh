#!/bin/bash
samp_rate=$1
center_freq=$2
ppm=$3
rf_gain=$4
$( ssh -v root@192.168.8.250 "rtl_sdr -s $samp_rate -f $center_freq -p $ppm -g $rf_gain - | socat - UDP:192.168.8.22:9009" ) &
#nc -u -l 9009 
socat udp-recvfrom:9009,fork - 
