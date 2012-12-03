
import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

PGraphics canvas;
int canvas_width = 3300;  
int canvas_height = 3300; 
float cutter = 0.18;
Pattern pattern;


void setup() {
  
  
  size( int( canvas_width*cutter ), int( canvas_height*cutter ) );
  canvas = createGraphics( canvas_width, canvas_height, P2D);

  pattern = new Pattern(3, 100);
  
  canvas.beginDraw();
  canvas.colorMode( HSB, 1, 1, 1 );
  canvas.background(0,0,1);  
  canvas.translate(-0.9*width,-6.5*height);
  canvas.rotate(HALF_PI/2);
  
  
  
  pattern.display();
  
  canvas.endDraw();
  canvas.save("identity" +year()+day()+hour()+minute()+ ".tif");
  image( canvas, 0, 0, width, height) ;

}

void draw() {}

void keyPressed(){
  if(key == 'r'){
    pattern.chooseRandomPattern();
  }
}
