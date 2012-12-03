import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

PGraphics canvas;
int canvas_width = 3300;  
int canvas_height = 5400; 
float cutter = 0.18;
Pattern pattern;
Sneaker sneaker;

void setup() {
  
  size( int( canvas_width*cutter ), int( canvas_height*cutter ) );
  canvas = createGraphics( canvas_width, canvas_height);
 
  pattern = new Pattern(100);
  sneaker = new Sneaker(0);
   
  canvas.beginDraw();
  
  canvas.colorMode(HSB, 1, 1, 1);
  canvas.background(0, 0, 1);

  pattern.display();
  
  canvas.endDraw();
  image(canvas, 0, 0, width, height);
  
}



