#!/bin/bash

echo -n "" > report.log
counter=0
array=()
while true; do
  array+=(1 2 3 4 5 6 7 8 9 10)
  counter=$((counter + 1))
  if [[ "$counter" == "10000" ]]; then
    echo "${#array[*]}" >> report.log
    counter=0
  fi
done
