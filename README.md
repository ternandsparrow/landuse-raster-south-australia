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
If you view the generated raster in QGIS, there is a colour map file you can use.

To use it (based on QGIS 3.6):
  1. open QGIS
  1. Layer -> Add Layer -> Add Raster Layer
  1. select the raster you built using this repo, you can select the .gz file too
  1. press *Add* then *Close*
  1. you should see a greyscale map so far
  1. right click the `south_australia_landcover.tif` layer in the *Layers* panel
  1. select *Properties* from the right-click menu
  1. select the *Symbology* item from the menu on th left
  1. change *Render type* to *Palleted/Unique values*
  1. select the file browser (`...` button to the right of the *Classify* and *Delete All* buttons)
  1. select the `styles/styles.clr` file from this repo
