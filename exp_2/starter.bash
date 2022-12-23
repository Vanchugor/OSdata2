#!/bin/bash

N=3090000

for (( c=0; c<"$1"; c++ ))
do
   bash newmem.bash "$N"
   sleep 1
done
