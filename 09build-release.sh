#!/usr/bin/env bash
set -e
cd `dirname "$0"`
source .common.sh
cd $ws_dir

tif_file_count=`bash -c 'ls -1 *.tif | wc -l'`
if [ "$tif_file_count" != "1" ]; then
  echo "[ERROR] expected exactly 1 TIFF file, found $tif_file_count"
  exit 1
fi

changes_file=CHANGES.txt
printf "
CHANGES
The original file was a shapefile. We used that shapefile and converted a cropped
section of it to a raster using the LU_CODEN field for the pixel value. The pixel
size is $metres_per_pixel metres per pixel and they're square.

View the original file at https://data.sa.gov.au/data/dataset/land-use-aclump.
" > $changes_file

unique_id=`date +%Y%m%d`
final_archive=landuse_raster_south_australia_${metres_per_pixel}m_$unique_id.zip
zip $final_archive \
  $changes_file \
  *.tif \
  CC_BY.txt

echo "[INFO] archive is built at $ws_dir/$final_archive"
