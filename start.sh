#!/bin/bash
samp_rate=$1
center_freq=$2
ppm=$3
rf_gain=$4
ssh -v root@192.168.8.250 "rtl_sdr -b 131072 -s $samp_rate -f $center_freq -p $ppm -g $rf_gain - | nc -u 192.168.8.22 9009" &
#ssh -v root@192.168.8.250 "rtl_sdr -s $samp_rate -f $center_freq -p $ppm -g $rf_gain - | nc -u 192.168.8.22 9009" &
while sleep 0.1; do nc -u -l 9009 ; done
