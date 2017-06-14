#!/bin/bash

clear;

# check dependencies
echo "Checking dependencies:"

if hash gs 2>/dev/null; then
    echo "* gs   : found!"
else
    echo "\"gs\" must be installed. Aborting."
    exit 1;
fi

if hash convert 2>/dev/null; then
    echo "* convert : found!"
else
    echo "\"convert\" must be installed. Aborting."
    exit 1;
fi

# get a list of scans in folder
pictures=`find . -maxdepth 1 -iname '*.jpg'`

# declare array
declare -a pdflist

# create pdf page from A4 scan
for picture in $pictures; do

    # current file
    current_file=$picture

    # full filename (with extension)
    full_filename=${current_file##*/}

    # filename without extension
    filename=${full_filename%.*}

    # new filename
    new_filename=$filename.pdf

    #echo $full_filename
    #echo $new_filename

    # convert pdf page
    convert -page a4 $full_filename $new_filename

    echo "Created PDF $new_filename"

    # store pdf filename to array
    pdflist=("${pdflist[@]}" $new_filename)

done

# print pdf array items
#echo ${pdflist[@]}

# join multiple pdf with ghostscript
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=merged.pdf ${pdflist[@]}

echo "Done. Please clean up single PDF files and rename merged.pdf"
