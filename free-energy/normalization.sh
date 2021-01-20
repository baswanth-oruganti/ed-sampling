#!/bin/bash


awk 'NR==2{max=$2}; $1!="#!"{if (max<$2) max=$2};END{printf "max=%.2f\n",max}' COLVAR
awk 'NR==2{min=$2}; $1!="#!"{if (min>$2) min=$2};END{printf "min=%.2f\n",min}' COLVAR


# min-max scaling or Normalization

max=71.0
min=0.0
awk '$1!="#!" {print}' COLVAR | awk -v "maxi=$max" -v "mini=$min" '{printf "%4.2f\t%4.2f\n",($2-mini)/(maxi-mini),$3}' > normalized.txt

