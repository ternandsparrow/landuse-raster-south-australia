#!/usr/bin/env bash
set -e
cd `dirname "$0"`
source .common.sh
mkdir -p $ws_dir
if [ -f $ws_dir/LANDSCAPE_LandUse_ALUM.shp ]; then
  echo '[INFO] shapefile already exists, not downloading again.'
  exit 0
fi
cd $ws_dir
zip_file=LANDSCAPE_LandUse_ALUM_shp.zip
if [ ! -f $zip_file ]; then
  wget \
    -O $zip_file \
    http://www.waterconnect.sa.gov.au/Content/Downloads/DEWNR/LANDSCAPE_LandUse_ALUM_shp.zip
fi
unzip -u $zip_file
