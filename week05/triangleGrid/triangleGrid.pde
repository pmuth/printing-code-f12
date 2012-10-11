
import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

PGraphics canvas;
int canvas_width = 3300;  
int canvas_height = 3300; 
float cutter = 0.2;

void setup() {
  size( int( canvas_width*cutter ), int( canvas_height*cutter ) );
  canvas = createGraphics( canvas_width, canvas_height, P2D);

  canvas.colorMode(HSB, 1, 1, 1);
  
 
  canvas.beginDraw();
  //canvas.colorMode( HSB, 1, 1, 1 );
  canvas.background(1,0,0);
  
  ModularGrid grid = new ModularGrid(10);
  
  grid.displayGrid();


  canvas.endDraw();
  canvas.save("identity" +year()+day()+hour()+minute()+ ".tif");
  image( canvas, 0, 0, width, height );

}
