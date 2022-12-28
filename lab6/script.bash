#!/bin/bash
poly="1.0"
sign="1.0"
result="0.0"
for (( i = 1; i < 500000000; i++ ))
do
   poly=$(echo "$poly*$1" | tr -d $'\r' | bc -l)
   echo "PLY: $poly"
   result=$(echo "$result+$sign*$poly/$i" | tr -d $'\r' | bc -l)
   echo "RES: $result"
   sign=$(echo "-1.0*$sign" | tr -d $'\r' | bc -l)
   echo "SIG: $sign"
   echo "------------------------"
done

echo "$result"
