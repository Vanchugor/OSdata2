#!/bin/bash
poly="1.0"
sign="1.0"
result="1.0"
x=$1
for (( i = 0; i < 500000000; i++ ))
do
   poly=$(echo "$poly*$x" | tr -d $'\r' | bc -l)
   echo "1"
   temp=$(echo "$sign*$poly" | tr -d $'\r' | bc -l)
   echo "2"
   temp2=$(echo "$temp/$i" | tr -d $'\r' | bc -l)
   echo "3"
   result=$(echo "$result+$temp2" | tr -d $'\r' | bc -l)
   echo "4"
   sign=$(echo "-1.0*$sign" | tr -d $'\r' | bc -l)
   echo "5"
   echo "------------------------"
done

echo "$result"
