#!/bin/bash
#################################### RUN INSTRUCTIONS ###################################
# 1) cd ./data-wrangling
# 2) source ./create_dir.sh
# 3) source ./parse.sh
# 4) source ./monitor.sh

#################################### FUNCTIONALITY ######################################
# watch command in unix will run the specified command at regular intervals
# In this case parse.sh (used to parse multiple metrics.json files and generate single.csv file) will be run every 60 seconds
# Alternatively crontab can also be used to execute a command at regular intervals. It is however not used in the script
#########################################################################################
watch -n 60 parse.sh
#crontab -e
#***** ./parse.sh
