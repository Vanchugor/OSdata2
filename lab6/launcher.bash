#!/bin/bash

for (( N = 0; N < $1; N++ ))
do
   { time $(./script $N); } > sc_data
done
