# InkScape_layers_export
This is a short bash script to use InkScape to create powerpoint-like presentations. 

You need to use InkScape to produce your presentation. InkScape is a professional tool to create graphics and works with vector images. The final product is gorgeous. It does have a learning curve, however the number of usages for the tool really pay off.

See instructions steps:

1 - Resize the canvas. The size 800 x 600 works for most presentations.

2 - Create your presentation using each slide as one layer. DO NOT use the JessyInk plugin. DO NOT duplicate layers. To duplicate slides: create a new layer, duplicate the content (Ctrl+D) and move the copy to the layer above.

3 - Order the layers as the slides. From bottom to top.

4 - Make all layers visible. Yes, it looks a mess when you do this. Layers not visible will appear as blank slides.

5 - Save your presentation as ".svg".

6 - Run the script. Depends on 'pdftk' to run. The script will store individual layers as pdf files in a temporary directory ".temp_layer". The script removes the directory at the end.

Usage example:

$ ./Inkscape_to_pdf.sh my_presentation.svg my_final_presentation.pdf
