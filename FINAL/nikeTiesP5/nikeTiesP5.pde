import controlP5.*;

import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;
ControlP5 cp5;
PGraphics canvas;
int canvas_width = 3300;  
int canvas_height = 5400; 
//float cutter = 0.18;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;


Pattern pattern;
Sneaker sneaker;

void setup() {
  
  //size( int( canvas_width*cutter ), int( canvas_height*cutter ) );
  //canvas = createGraphics( canvas_width, canvas_height);
  
  size(1200, 900);
 
  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();
  
  addControllers();
   
  pattern = new Pattern(100);
  sneaker = new Sneaker(0);
  
  int stripeNumber = 0;
  
  
  //cp5.addButton("addStripe").pattern.addStripe();
  
}

void draw() {
   //needs to be here looping for ControlP5 
}

void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

public void addControllers() {
  cp5 = new ControlP5(this);
  DropdownList d1; 
  cp5.addButton("addStripe").linebreak();
  cp5.addButton("removeStripe").linebreak();
  cp5.addButton("changeColor").linebreak();
  
  cp5.addSlider("numStripe", 1, 10)
    .setNumberOfTickMarks(10)
    .linebreak();
    
 cp5.addButton("saveImage").linebreak();
 

  
  
}



public void controlEvent(ControlEvent theEvent) {
  
  drawScreen();
  
}

void drawScreen() {
  
  colorMode(HSB,1,1,1);
  
  drawCanvas();
  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;
  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);
  
}

void saveImage(int theValue ) {
  println("Saving high quality image");
  canvas.save("image_" + year() + "_" + month()+ "_" + day() + "_" + hour() + "_" + minute() + "_" + second() + ".tiff");
  println("Saved");
}

void drawCanvas() {
  println("HYPE");
  canvas.beginDraw();
  canvas.colorMode(HSB, 1, 1, 1);
  canvas.background(0, 0, 1);
  
  pattern.display();
  
  canvas.endDraw();
  
  
}

public void addStripe() {
 
 pattern.addStripe();
  
}

public void removeStripe() {
  
 pattern.removeStripe();
 println("REMOVE");
}

public void changeColor() {
 
 
  
}

