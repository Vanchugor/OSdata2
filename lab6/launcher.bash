#!/bin/bash

delta=0.01
point=0.0
for (( i = 0; i < $1; i++ ))
do
  bash script.bash $point
  point=$(echo "$point+$delta" | tr -d $'\r' | bc -l)
done
