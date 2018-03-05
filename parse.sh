#!/bin/bash

########################### RUN INSTRUCTIONS ###########################################
# 1) cd ./data-wrangling
# 2) source ./create_dir.sh
# 3) source ./parse.sh

############################ OVERVIEW #########################################
# The script when executed does the following
# 1) Takes the /var/run/tentant/<integer_folder>/metrics.json files as the input for processing
# INPUT - metrics.json data format
#{
#    "a": 23,
#    "b": 43.2,
#    ....
#}
# 2) Outputs single.csv containing the data in the following format
#          Timestamp,TentantID,Metric,Value
#          1520146989,1,a,23
#          1520146989,1,b,43.2
#          ......

########################## FUNCTIONALITY ###################################
# 1) awk command is used to parse through all metrics.json files inside /var/run/tenant/<integer_folder>/  and extract the required information
# 2) awk is used to split every line based on a pattern and save the data to inbuilt variables $1 and $2 (awk '/pattern/ {action_command}')
#       For eg. For the following line in metrics.json,
#       "a": 23,
# 3) To extract a and 23 and save into Inbuilt variables $1 and $2 respectively
#       awk '/"*":/ {print "$1" , "$2"}   (For each line in metrics.json, when a pattern "*": is seen,
#       Save "a": --> $1 and 23, --> $2
# 4) To extract a from "a": and 23 from 23,
#       gsub is used to extract the required data as follows
#       gsub("[:\"]","",$1) --> Substitutes " and : characters with NONE type. "a": becomes a
#       gsub("[,]","",$2)   --> Substitues , with NONE type. 23, becomes 23
# 5) timestamp command is added to the awk with -v argument (variable argument)
#       timestamp=$(date +%s)
##############################################################################

MYDIR="./var/run/tenant/"
DIRS=`ls -l $MYDIR | egrep '^d' | awk '{print $9}'`
timestamp=$(date +%s)
echo "Timestamp,TentantID,Metric,Value" > ./single_$timestamp.csv

for DIR in $DIRS
do
      awk -v timestamp=$(date +%s) -v y="$DIR" '/"*":/ {gsub("[:\"]","",$1); gsub("[,]","",$2); print timestamp","y","$1","$2}' ./var/run/tenant/$DIR/metrics.json >> ./single_$timestamp.csv
done
