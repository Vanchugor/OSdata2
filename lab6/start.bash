#!/bin/bash

echo -n "" > sc_data
for (( N = 0; N < 20; N++ ))
do
  echo "**** CURRENT N = $N **** " >> sc_data
  for (( t = 0; t < 10; t++ ))
  do
    { time bash launcher.bash $N; } >> sc_data
  done
done
