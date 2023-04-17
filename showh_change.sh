#!/usr/bin/bash

FILE_NAME=/home/r_yamaguchi/shell/out.dat
STR=()
When=()
Where=()
Who=()
What=()
Why=()
How=()
i=0
a=0
count_line=0
rand=(0,0,0,0,0,0)

while read LINE
do
 STR=${LINE}
 echo $i
 KMG=(${STR//,/ })
 When[$i]=${KMG[0]}
 Where[$i]=${KMG[1]}
 Who[$i]=${KMG[2]}
 What[$i]=${KMG[3]}
 Why[$i]=${KMG[4]}
 How[$i]=${KMG[5]} 
 i=`expr ${i} + 1`
 echo $KMG
done<${FILE_NAME}

if [ $# -eq 0 ]; then
 end=1
else
 end=$1
fi


for i in `seq 1 $end`
do
 for j in `seq 0 6`
  do
	#echo "${When[$j]}"
	rand[$j]=`expr $RANDOM % 3`
	#echo "${rand[$j]}"
  done

  CURR_TIME=`date '+%Y-%m-%d %H:%M:%S'`
  CURR_HOUR=`date '+%Y-%m-%d-%H'`
  echo -e "[$CURR_TIME] ${When[${rand[0]}]},${Where[${rand[1]}]},${Who[${rand[2]}]},${What[${rand[3]}]},${Why[${rand[4]}]},${How[${rand[5]}]}" >> ${CURR_HOUR}_MOJIPITTA.txt
done
