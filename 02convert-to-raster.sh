#!/usr/bin/env bash
cd `dirname "$0"`
source .common.sh
which docker > /dev/null
rc=$?
set -e
if [ "$rc" != "0" ]; then
  echo '[ERROR] docker command not found, cannot continue'
  exit $rc
fi
cd $ws_dir

tif_file=landuse_sa_${metres_per_pixel}m.tif
limit_the_extent="-te 967587 1315849 1528877 1962113" # comment this to process whole state

touch $tif_file # ensure we own the file
docker run \
  --rm \
  -it \
  -v $(pwd):/data \
  geodata/gdal \
  gdal_rasterize \
    -a LU_CODEN \
    -ot Byte \
    -a_nodata 255 \
    -tr $metres_per_pixel $metres_per_pixel \
    $limit_the_extent \
    -l LANDSCAPE_LandUse_ALUM \
    LANDSCAPE_LandUse_ALUM.shp $tif_file
