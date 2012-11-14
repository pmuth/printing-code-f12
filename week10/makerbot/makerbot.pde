import geomerative.*;

PGraphics canvas;

void setup() {
  
   size( int( canvas_width*cutter ), int( canvas_height*cutter ) );
  canvas = createGraphics( canvas_width, canvas_height, P2D);
  
  canvas.beginDraw();
  canvas.colorMode( HSB, 1, 1, 1 );
  
  canvas.smooth();
  
  canvas.background(0);
  
  canvas.noFill();
  
  
  
  
  
  canvas.endDraw();
  
  //canvas.save("makerbot" +year()+day()+hour()+minute()+ ".tif");
  image(canvas, 0, 0, canvas.width*.2, canvas.height*.2);
  
  
}


