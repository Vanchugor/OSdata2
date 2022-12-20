#!/bin/bash

echo "mem_total mem_free mem_used mem_buff swap_total swap_free swap_used swap_avail" > mem_report.log
echo "pid nice virt res shr status cpu mem" > script_report.log
echo "1 2 3 4 5" > five_report.log

script_pid=$(cat .script_pid | grep -P "\d+") # get a pid of the script

result=""
while [[ "$(ps h $script_pid | wc -c)" != "0" ]]; do
  ### getting data
  snapshot_full=$(top -b -d 0.01 | head -200) # to get all the data
  snapshot_head=$(echo "$snapshot_full" | head -12) # short range
  # echo "snapshot_head"

  ### extract memory info
  memory_info=$(echo "$(echo "$snapshot_head" | tail -9 | head -2)")
  mem_line=$(echo "$memory_info" | head -1)
  swap_line=$(echo "$memory_info" | tail -1)

  mem_total=$(echo "$mem_line" | grep -o -P "\d+\.\d+g? total" | cut -d" " -f1)
  mem_free=$(echo "$mem_line" | grep -o -P "\d+\.\d+g? free" | cut -d" " -f1)
  mem_used=$(echo "$mem_line" | grep -o -P "\d+\.\d+g? used" | cut -d" " -f1)
  mem_buff=$(echo "$mem_line" | grep -o -P "\d+\.\d+g? buff" | cut -d" " -f1)

  swap_total=$(echo "$swap_line" | grep -o -P "\d+\.\d+g? total" | cut -d" " -f1)
  swap_free=$(echo "$swap_line" | grep -o -P "\d+\.\d+g? free" | cut -d" " -f1)
  swap_used=$(echo "$swap_line" | grep -o -P "\d+\.\d+g? used" | cut -d" " -f1)
  swap_avail=$(echo "$swap_line" | grep -o -P "\d+\.\d+g? avail" | cut -d" " -f1)

  result=$mem_total" "$mem_free" "$mem_used" "$mem_buff" "$swap_total" "$swap_free" "$swap_used" "$swap_avail
  echo "$result" >> mem_report.log # write to log

  ### extract script process info
  script_line=$(echo "$snapshot_full" | grep $script_pid | head -1 | tr -s " ")

#  sc_nice=$(echo "$script_line" | cut -d" " -f4)
#  sc_virt=$(echo "$script_line" | cut -d" " -f5)
#  sc_res=$(echo "$script_line" | cut -d" " -f6)
#  sc_shr=$(echo "$script_line" | cut -d" " -f7)
#  sc_st=$(echo "$script_line" | cut -d" " -f8)
#  sc_cpu=$(echo "$script_line" | cut -d" " -f9)
#  sc_mem=$(echo "$script_line" | cut -d" " -f10)

#  result=$script_pid" "$sc_nice" "$sc_virt" "$sc_res" "$sc_shr" "$sc_st" "$sc_cpu" "$sc_mem
#  echo "$result" >> script_report.log # write to log

  echo "$script_line" >> script_report.log

  ### extract info about the first five processes
  result=$(echo "$snapshot_head" | tail -5 | awk '{ORS=" "}{print $1" ("$12")"}')
  echo "$result" >> five_report.log # write to log
done