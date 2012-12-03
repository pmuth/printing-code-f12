import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

import geomerative.*;


PGraphics canvas;
int canvas_width = 5070;  
int canvas_height = 6600; 
float cutter = 0.2;

//PFont FuturaCondensedExtraBold;
PFont DesignerBlock;

RFont font;

RGroup grp;
RPoint[] pnts;

RGroup individualChar; 
RPoint[] individualPnts;

void setup() {
  size( int( canvas_width*cutter ), int( canvas_height*cutter ) );

  //FuturaCondensedExtraBold = loadFont("Futura-CondensedExtraBold-48.vlw");
  DesignerBlock = loadFont("DesignerBlock-48.vlw");
  canvas = createGraphics( canvas_width, canvas_height, P2D);
  //canvas.colorMode(HSB, 1, 1, 1);
  canvas.beginDraw();
  //canvas.colorMode(HSB, 1,1,1);
  canvas.background(0, 115, 75);
  

  
  
  //canvas.fill(0.7, 0.5, 0.5);
  
  ModularGrid grid = new ModularGrid(70,70,5,50);
  
  grid.display();


  
  canvas.endDraw();
  canvas.save("makerbot" + year()+day()+hour()+minute()+ ".tif");
  image(canvas, 0, 0, width, height);
  
}
