#!/bin/bash

for (( t = 1; t < 6; t++ ))
  do
    for (( i = "$(( $t + 5 ))"; i < 21; i = i + 5 )); do
        mkdir "data_$i"
        cp "data_$t/data_"$t"_t1.txt" "data_$i/data_"$i"_t1.txt"
        cp "data_$t/data_"$t"_t2.txt" "data_$i/data_"$i"_t2.txt"
        cp "data_$t/data_"$t"_t3.txt" "data_$i/data_"$i"_t3.txt"
        cp "data_$t/data_"$t"_t4.txt" "data_$i/data_"$i"_t4.txt"
        cp "data_$t/data_"$t"_t5.txt" "data_$i/data_"$i"_t5.txt"
    done
  done

