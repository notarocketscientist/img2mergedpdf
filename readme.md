# Scalepix

## What is it?

A shell script to convert a bunch of scaned A4 images to a single (merged) PDF.

## Why is that useful?

When I scan A4 documents with multiple pages the result is multiple JPG-Files.

This script automates the conversion of multiple A4 JPGs to a single PDF-file.

## Caution / infos / todos

* Sorting is not supported. The script assumes a correct sort order in your folder img01.jpg, img02.jpg, img03.jpg etc
* only JPG supported at the moment
* merged file is called "merged.pdf" - feel free to manually rename it
* cleanup of created A4 PDF pages has to be done manually at the moment

## First setup

* clone repo or download .sh-file
* make it executable: `chmod +x img2mergedpdf.sh`
* `mv` script to a folder with your JPG-files

## Dependencies

* ghostscript / gs
* convert

### Install dependencies on Mac (Homebrew)

```
brew install gs
brew install imagemagick
```

### Install dependencies on Debian/Ubuntu

```
sudo apt-get install ghostscript
sudo apt-get install imagemagick
```

## Usage

```
# mv script to a folder with JPG files, then execute
./img2mergedpdf.sh
```
