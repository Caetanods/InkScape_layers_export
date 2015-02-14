#!/bin/bash

## This is a script to export a presentation made in Inkscape to a presentation in pdf.
## This script ignores any effect in the presentation. Do not use effects in your presentation.
## Note that this IS NOT using the JessyInk plugin. Just create simple layers.

if [[ -z $1 ]]; then
    echo 'Please provide the svg file as $1.'
    exit
fi

 if [[ -z $2 ]]; then
     echo 'Please name the output pdf as $2.'
     exit
 fi

# List the layers in a file:
LAYERS=`inkscape --query-all $1 | grep layer | awk -F, '{print $1}'`
TOTAL=`echo "$LAYERS" | wc -l`

# Make temporary directory for individual files.
mkdir .temp_layer

# Read the layers name and export them to single pdf files:
COUNT=1
for LAYER in `echo "$LAYERS"`
do
    # This trick '-ne' and '\r' will overwrite a line in printing:
    echo -ne "Exporting layer " $COUNT "of " $TOTAL "...\r"
    inkscape $1 -i $LAYER -j -C --export-pdf=.temp_layer/layer$COUNT.pdf
    let COUNT=COUNT+1
done

# Aggregate the pdf layers into a single file:
# (This part of the script needs pdftk to work)
PDF=`ls -cr .temp_layer/layer*.pdf`
echo ""
echo "Merging layers ..."
pdftk $PDF cat output $2

rm -r .temp_layer
