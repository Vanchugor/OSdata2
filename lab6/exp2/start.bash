#!/bin/bash

echo -n "" > sc_data.txt
for (( file_num = 1; file_num < 21; file_num++ ))
do
  echo "**** CURRENT file_num = $file_num **** "
  echo "**** CURRENT file_num = $file_num **** " >> sc_data.txt
  for (( t = 1; t < 6; t++ ))
  do
    echo "** CURRENT t = $t ** "
#    { time bash handler.bash $t $file_num; } 2>> sc_data.txt &
    { time bash handler.bash $t $file_num; } 2>> sc_data.txt
  done
#  wait
done
