import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

PGraphics canvas;
int canvas_width = 3300;
int canvas_height = 5100;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

void setup()  {
 
 size(canvas_width/4, canvas_height/4);
 colorMode(HSB, 1, 1, 1);
 
 canvas = createGraphics(canvas_width, canvas_height, P2D);
 calculateResizeRatio();
 canvas.beginDraw();
 canvas.background(255);
 canvas.smooth();
 //canvas.fill(3);
  noStroke();  
  
  TColor redColor = TColor.newHSV(0, 1, 1);

  canvas.fill(redColor.hue(), redColor.saturation(), redColor.brightness());
  canvas.rect(0,0, 1000, 1000);
  
  
  
 canvas.endDraw();
  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;
  
  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

 
 canvas.save("identity_" + year() + "_" + month()+ "_" + day() + "_" + hour() + "_" + minute() + "_" + second() + ".tiff");

}



void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;
  
  if(ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}
