All the steps required to generate a raster of land uses for South Australia.

## What data are we working with?
We're working with the https://data.sa.gov.au/data/dataset/land-use-aclump dataset here.

## How to build the raster
You'll need the following to use this repo:

 1. a *nix computer (OSX might work but is untested)
 1. `docker` (https://www.docker.com/)

You just need to run the shell scripts in order: 01, 02, etc:
```bash
./01get-shapefile.sh
./02convert-to-raster.sh
ls -lh workspace/landuse_sa_*m.tif # check your output file
```

## Building a release
Not everyone wants to build the raster themselves so we make it available
as a release on GitHub.

Follow these steps to create and deploy a release:

 1. run the 'how to build the raster' steps from above
 1. run `./09build-release.sh`
 1. upload the built archive to GitHub as a release

## Pretty maps
If you view the generated raster in QGIS, there is a colour map file you can
use: `styles/landuse_sa-colour_map.txt`.
