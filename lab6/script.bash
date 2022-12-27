#!/bin/bash
result=1.0
poly="100"
sign=1.0
result=$(echo "$poly/3" | bc -l)
echo "$result"
#for i in {1..500000000}
#do
#   poly=
#done
