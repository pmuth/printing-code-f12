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

int stripeNumber = 0;
int stripeThickness = 1;
int baseThickness = 50;
int numberSneakers = 6;

DropdownList d1, d2;

ArrayList <ColorList> nikes = new ArrayList<ColorList>(); 

void setup() {
  
  //size( int( canvas_width*cutter ), int( canvas_height*cutter ) );
  //canvas = createGraphics( canvas_width, canvas_height);
  
  size(875, 900);
  
  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();
  
  addControllers();
  generateSneakers();
  
   
  pattern = new Pattern(baseThickness);
  
}

void draw() {
//println(stripeNumber);
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
  
  cp5.begin();
  
  cp5.addButton("addStripe").linebreak();
  cp5.addButton("removeStripe").linebreak();
  cp5.addButton("changeColor").linebreak();
  cp5.addButton("changeThickness").linebreak();
  cp5.addSlider("stripeNumber", 0, 9).linebreak();
  cp5.addSlider("baseThickness", 50, 500)
    .setNumberOfTickMarks(10)
    .linebreak();
  cp5.addSlider("stripeThickness", 1, 10)
    .setNumberOfTickMarks(10)
    .linebreak();
    
  cp5.addButton("saveImage").linebreak();
  
  
  d1 = cp5.addDropdownList("sneakers").setPosition(10, 500);
    d1.setBackgroundColor(color(190));
  d1.setItemHeight(20);
  d1.setBarHeight(15);
  d1.captionLabel().set("SNEAKER");
  d1.captionLabel().style().marginTop = 3;
  d1.captionLabel().style().marginLeft = 3;
  d1.valueLabel().style().marginTop = 3;
  d1.addItem("Air Max 90", 1);
  d1.addItem("Air Max 95", 2);
  d1.addItem("Air Safari", 3);
  d1.addItem("Air Tech Challenge", 4);
  d1.addItem("Jordan III", 5);
  d1.addItem("Tiffany SB", 6);
  //ddl.scroll(0);
  d1.setColorBackground(color(60));
  d1.setColorActive(color(255, 128));
  cp5.end();
  
}

public void customize(DropdownList ddl) {
//  ddl.setBackgroundColor(color(190));
//  ddl.setItemHeight(20);
//  ddl.setBarHeight(15);
//  ddl.captionLabel().set("SNEAKER");
//  ddl.captionLabel().style().marginTop = 3;
//  ddl.captionLabel().style().marginLeft = 3;
//  ddl.valueLabel().style().marginTop = 3;
//  ddl.addItem("Air Max 90", 1);
//  ddl.addItem("Air Max 95", 2);
//  ddl.addItem("Air Safari", 3);
//  ddl.addItem("Air Tech Challenge", 4);
//  ddl.addItem("Jordan III", 5);
//  ddl.addItem("Tiffany SB", 6);
//  //ddl.scroll(0);
//  ddl.setColorBackground(color(60));
//  ddl.setColorActive(color(255, 128));
  
}

public void controlEvent(ControlEvent theEvent) {
  
  drawScreen();
  
  if (theEvent.isGroup()) {
    // check if the Event was triggered from a ControlGroup
    println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
  } 
  else if (theEvent.isController()) {
    println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
  }
  
}

void drawScreen() {
  
  colorMode(HSB,1,1,1);
  background(0,0,0);
  drawCanvas();
  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;
  //image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);
  image(canvas, 300, 0, resizedWidth, resizedHeight);
}

void saveImage(int theValue) {
  println("Saving high quality image");
  canvas.save("image_" + year() + "_" + month()+ "_" + day() + "_" + hour() + "_" + minute() + "_" + second() + ".tiff");
  println("Saved");
}

void drawCanvas() {
  println("HYPE");
  canvas.beginDraw();
  canvas.colorMode(HSB, 1, 1, 1);
  canvas.background(0, 0, 1);
 
  canvas.pushMatrix();
  canvas.translate(-canvas.width*2, 0);
  canvas.rotate(-HALF_PI/2);
  pattern.baseThickness = baseThickness;
  pattern.display();
  canvas.popMatrix();
  
  //canvas.translate(0,0);
//  canvas.fill(0.5,0.5,0.5);
//  canvas.rect(500, 500, canvas.width/2, canvas.height/2);


  drawOutline();
  
  canvas.endDraw();
  
}

public void addStripe() {
 
 pattern.addStripe();
 drawOutline();
  
}

public void changeThickness(int number, int thickness) {
 
  pattern.changeThickness(stripeNumber, stripeThickness);
  println("SUCCESS");
  
}

public void removeStripe(int number) {
  
 pattern.removeStripe(stripeNumber);
 println("REMOVE");
}

public void changeColor() {
 
 pattern.changeStripeColor(stripeNumber);
 println(stripeNumber); 
}

public void generateSneakers() {

  for (int i = 0; i < numberSneakers; i++) {
   nikes.add(new ColorList()); 
  }
  
  //Tiffany SB
  nikes.get(0).add(TColor.newHSV(0.48, 0.44, 0.63));    //Tiffany Blue
  nikes.get(0).add(TColor.newHSV(0.00, 0.00, 0.00));    //Black
  nikes.get(0).add(TColor.newHSV(0.59, 0.44, 0.83));    //Silver
  
  
  
}

public void drawOutline() {
  
//    canvas.fill(0.5,0.5,0.5);
//    canvas.rect(500, 500, canvas.width/2, canvas.height/2);
      
      canvas.fill(0.0, 0.0, 1.0);
      canvas.rect(0, 0, canvas.width, (canvas.height/20));
      canvas.rect(0, 0, (0.2*canvas.width), canvas.height);   //LEFT SIDE RECTANGLE
      canvas.rect((0.8*canvas.width), 0, (0.2*canvas.width), canvas.height);
      canvas.rect(0, (0.80*canvas.height), canvas.width, ((0.20)*canvas.height));
  
      //canvas.triangle(); 
}

