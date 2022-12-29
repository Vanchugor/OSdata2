#!/bin/bash

for (( t = 1; t < 6; t++ ))
  do
    for (( i = "$(( $t + 5 ))"; i < 21; i = i + 5 )); do
        mkdir "data_$i"
        cp "data_$t/data_"$t"_t1" "data_$i/data_"$i"_t1"
        cp "data_$t/data_"$t"_t2" "data_$i/data_"$i"_t2"
        cp "data_$t/data_"$t"_t3" "data_$i/data_"$i"_t3"
        cp "data_$t/data_"$t"_t4" "data_$i/data_"$i"_t4"
        cp "data_$t/data_"$t"_t5" "data_$i/data_"$i"_t5"
    done
  done

