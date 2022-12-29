#!/bin/bash

os_data_file="os_data_$2_t$1.txt"
echo -n "" > $os_data_file

data_file="data_$2_t$1.txt"

cpu_data=""
mem_total_data=""
mem_avail_data=""
period=1000
counter="$period"
mem_total_data=$(cat /proc/meminfo | grep MemTotal | grep -P -o "\d+")
stdbuf --input=0 awk '{ for ( i = 1; i < NF + 1; ++i ) print $(i); }' $data_file |
while IFS= read -r var
do
    if [[ "$(( $counter % $period ))" == "0" ]]; then
      cpu_data="$(cat /proc/stat | grep cpu | tail -1 | awk '{print ($5*100)/($2+$3+$4+$5+$6+$7+$8+$9+$10)}' | awk '{print 100-$1}') "
      mem_avail_data=$(cat /proc/meminfo | grep MemAvailable | grep -P -o "\d+")
      echo "$cpu_data $mem_total_data $mem_avail_data" >> $os_data_file
      counter=1
    fi
    result=$(( $var * 2 ))" "
    echo -n "$result" >> $data_file
    counter=$(( $counter + 1 ))
done
