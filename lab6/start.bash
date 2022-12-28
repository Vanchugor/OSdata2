#!/bin/bash

echo -n "" > sc_data
for (( N = 1; N < 21; N++ ))
do
  echo "**** CURRENT N = $N **** "
  echo "**** CURRENT N = $N **** " >> sc_data
  for (( t = 0; t < 10; t++ ))
  do
    echo "** CURRENT t = $t ** "
    { time bash launcher.bash $N; } 2>> sc_data &
#    { time bash launcher.bash $N; } 2>> sc_data
  done
done
