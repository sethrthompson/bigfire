#############################################################################################
#Title: degrib_alaska.sh
#Description: This is a program to loop through all sub folders in the AR.alaska directory
#             and complete the process of "degrib" for each file in each folder (RT.00 - RT.23
#Date Created:1/28/19
#Author: Team HotShots
#############################################################################################


#!/bin/bash

### Code below iterates through each folder, then each file in the folder and degribs the 
### appropriate file
for folder in /data/RTMA/AR.alaska/*;
do
[ -d $folder ] && cd $folder && /home/seth/degrib $folder"/ds.temp.bin" -C -Flt && /home/seth/degrib $folder"/ds.wdir.bin" -C -Flt && /home/seth/degrib $folder"/ds.wspd.bin" -C -Flt
done;

### The code below will call the program "gdal_alaska.sh" and will execute that file
### once the degribbing process has completed.
/data/RTMA/./gdal_alaska.sh