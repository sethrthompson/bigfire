#############################################################################################
#Title: gdal_conue.sh
#Description: This is a program to complete the gdal process on each file that has completed
#             the degrib process in each sub directory (RT.00-RT.23) in AR.conus folder.
#             This program is initiated at the completion of the degribbing process.
#Date Created:1/28/19
#Author: Team HotShots
#############################################################################################

#!/bin/bash


for folder in /data/RTMA/AR.conus/*;
do
[ -d $folder ] && cd $folder
for file in $folder/*.flt;
do
gdalwarp -of GTiff -t_srs EPSG:4326 $file "$file".tif
done;
done;
