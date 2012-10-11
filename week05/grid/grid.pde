PGraphics canvas;
int canvas_width = 3300;  
int canvas_height = 5100; 
float cutter = 0.18;

void setup() {
  size( int( canvas_width*cutter ), int( canvas_height*cutter ) );
  canvas = createGraphics( canvas_width, canvas_height, P2D);

 
  canvas.beginDraw();
  canvas.colorMode( HSB, 1, 1, 1 );
  
  
  
  canvas.endDraw();
  canvas.save("identity" +year()+day()+hour()+minute()+ ".tif");
  image( canvas, 0, 0, width, height) ;

}
