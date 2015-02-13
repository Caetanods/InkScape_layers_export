# InkScape_layers_export
This is a short bash script to use InkScape to create powerpoint-like presentations. First create the presentations using new layers as slides. Make sure the layers are in the same order of the final presentation. Use the script to export the layers as single pdf files. The script finishes by calling 'pdftk' to merge the individual pdf layers as the final presentation.
That is it! You have a pdf presentation to enjoy!

Usage example:

$./Inkscape_to_pdf.sh my_presentation.svg my_final_presentation.pdf
