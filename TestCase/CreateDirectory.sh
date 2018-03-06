#!/bin/bash

####################### RUN INSTRUCTIONS #######################################
# 1) cd ./data-wrangling
# 2) source ./create_dir.sh 

####################### FUNCTIONALITY  ########################################

#The script when executed does the following:
# 1) Creates the following directory structure inside the ./data-wrangling
# 2) Copies metrics.json from the ./data-wrangling directory level to each of the /var/run/tentant/<1 to 10> directories

#####################   /var/run/tenant ##########################################
#                              |
#---------------------------------------------------------------------
# |       |       |      |      |      |      |      |       |       |
# 1       2       3      4      5      6      7      8       9       10
# |       |       |      |      |      |      |      |       |       |
# JSON   JSON    JSON   JSON   JSON   JSON   JSON   JSON    JSON    JSON
##################################################################################

for x in {1..10} ;
do 
    mkdir -p ./var/run/tenant/$x ;
    cp ./metrics.json ./var/run/tenant/$x;
done
