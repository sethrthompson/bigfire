#############################################################################################
#Title: degrib_conus.sh
#Description: This is a program to loop through all sub folders in the AR.conus directory
#             and complete the process of "degrib" for each file in each folder (RT.00 - RT.23
#Date Created:1/28/19
#Author: Team HotShots
#############################################################################################

#!/bin/bash


for folder in /data/RTMA/AR.conus/*;
do
[ -d $folder ] && cd $folder && /home/seth/degrib $folder"/ds.temp.bin" -C -Flt && /home/seth/degrib $folder"/ds.wdir.bin" -C -Flt && /home/seth/degrib $folder"/ds.wspd.bin" -C -Flt && /home/seth/degrib $folder"/ds.precipa.bin" -C -Flt
done;


#/data/RTMA/./gdal_conus.sh
