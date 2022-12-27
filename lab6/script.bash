#!/bin/bash
poly=1.0
sign=1.0
result=1.0
for i in {1..500000000}
do
   poly=$(echo "$poly * $1" | bc -l)
   result=$(echo "$result + $sign * ($poly / $i)" | bc -l)
   sign=$(echo "-1.0 * $sign" | bc -l)
done

echo "$result"
