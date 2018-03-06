# Data-Wrangling
Data wrangling, sometimes referred to as data munging, is the process of transforming and mapping data from one "raw" data form into another format with the intent of making it more appropriate and valuable for a variety of downstream purposes such as analytics.

We have a number of different data wrangling tools, but this repository holds a from-the-scratch shell scripts to perform data-wrangling.

Instruction to run the Script:

1. Download the Parse file - parse.sh , to the unix root directory which contains the /var directory.
2. run it on the Unix shell as follows: 
      Unix_shell > ./parse.sh &
3. The output for this script can be found in the "csv" directory, which will be generated at the present working directory. Under this directory, a csv file will get generated for every 60 seconds and will be in the format: single_<timestamp>.csv. 


Note:
The "&" is used to run the shell script in the background. We specifically use "&", as the script is expected to run every 60seconds.


Functionality of the Script:

"awk -v timestamp=$(date +%s) -v y="$DIR" '/"*":/ {gsub("[:\"]","",$1); gsub("[,]","",$2); print timestamp","y","$1","$2}' ./var/run/tenant/$DIR/metrics.json >> csv/single_$timestamp.csv"

 1) awk command is used to parse through all metrics.json files inside /var/run/tenant/<integer_folder>/  and extract the required information
 2) awk is used to split every line based on a pattern and save the data to inbuilt variables $1 and $2 (awk '/pattern/ {action_command}')
       For eg. For the following line in metrics.json,
       "a": 23,
 3) To extract a and 23 and save into Inbuilt variables $1 and $2 respectively
       awk '/"*":/ {print "$1" , "$2"}   (For each line in metrics.json, when a pattern "*": is seen, 
       Save "a": --> $1 and 23, --> $2
 4) To extract a from "a": and 23 from 23,
       gsub is used to extract the required data as follows
       gsub("[:\"]","",$1) --> Substitutes " and : characters with NONE type. "a": becomes a
       gsub("[,]","",$2)   --> Substitues , with NONE type. 23, becomes 23
 5) timestamp command is added to the awk with -v argument (variable argument)
       timestamp=$(date +%s)
 6) The sleep command is used to take a snapshot of the required data for every 60 seconds.


Instructions to run the test cases can be found in the "TestCase" folder.




Reference: https://en.wikipedia.org/wiki/Data_wrangling

