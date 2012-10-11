import geomerative.*;

PGraphics canvas;

int canvas_width = 5100;  
int canvas_height = 1800; 

float cutter = 0.18;


//Sippin On Some Syrup - BPM = 68

String charToDraw = "Sippin'_On_Some_Syrup";
float danceFactor = 30;
float segmentLength = 20;


//Bombs Over Bagdad - BPM = 154
//String charToDraw = "Bombs_Over_Baghdad";
//float danceFactor = 40;
//float segmentLength = 10;
//color cBackground = color (0.164, 0.34, 1);

RFont font;

RGroup grp;
RPoint[] pnts;

RGroup individualChar; 
RPoint[] individualPnts;

void setup() 
{
  
  size( int( canvas_width*cutter ), int( canvas_height*cutter ) );
  canvas = createGraphics( canvas_width, canvas_height, P2D);
  
  canvas.beginDraw();
  canvas.colorMode( HSB, 1, 1, 1 );
  
  canvas.smooth();
  
  int[] charWidth = new int[charToDraw.length()];
 
  // always initialize the library in setup
  RG.init(this);
  font = new RFont("FreeSansNoPunch.ttf", 3cv50, RFont.LEFT);

  RCommand.setSegmentLength(segmentLength);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  //Get points/width for entire string
  grp = font.toGroup(charToDraw);
  pnts = grp.getPoints();
  
  
  //Determine width of each character
  for (int i = 0; i < charToDraw.length(); i++) {
    
    individualChar=font.toGroup(str(charToDraw.charAt(i)));   
    charWidth[i] = int(individualChar.getWidth());
    
}
  //Syrup background
  //canvas.background(0); 
  
  
  //B.O.B. background
  canvas.background(0);
  
  canvas.noFill();
  
  // translate to the middle. Use plus in y because text is drawn from y and up
  
  int deadCenterX = int((canvas.width / 2) - (grp.getWidth() / 2));
  int deadCenterY = (canvas.height / 2);
  println(grp.getWidth());
  println(grp.getHeight());
  //translate(deadCenterX, deadCenterY);

  
// randomize the points
  
  int totalX = 0;
  int totalY = 0;
  
  for (int i = 0; i < charToDraw.length(); i++) {
      canvas.pushMatrix();
    //individualChar=font.toGroup(" ");
    individualChar=font.toGroup(str(charToDraw.charAt(i)));
    individualPnts = individualChar.getPoints();
    
    //individualPnts = individualChar.getPoints();
 
    canvas.translate(deadCenterX, deadCenterY);
  
    for (int j = 0; j < individualPnts.length; j++ ) {
      individualPnts[j].x += random(0, danceFactor);
      individualPnts[j].y += random(0, danceFactor);
    }

  // draw curved lines between points
  canvas.strokeWeight(0.08);
  
  //Syrup fill color
  //canvas.fill(0.77, 1, 1);
  canvas.fill(0,0,100);
  
  
  canvas.beginShape();
  canvas.curveVertex(individualPnts[individualPnts.length-1].x, individualPnts[individualPnts.length-1].y);
  for (int k=0; k<individualPnts.length; k=k+2) {
    canvas.curveVertex(individualPnts[k].x, individualPnts[k].y);
  }
  canvas.curveVertex(individualPnts[0].x, individualPnts[0].y);
  canvas.curveVertex(individualPnts[1].x, individualPnts[1].y);
  canvas.endShape(); 
  
  //println(individualChar.getWidth());
  //println("deadCenterX for + " + str(charToDraw.charAt(i)) + " = " + deadCenterX);
  deadCenterX = deadCenterX+ int(individualChar.getWidth());
  totalX = totalX + int(individualChar.getWidth()); 
  println("Total X = " + totalX);
  
  // draw straight lines between points
  canvas.strokeWeight(0.1);
  canvas.stroke(0);
//  canvas.beginShape();
//  for (int k=0; k<individualPnts.length; k=k+2) {
//    canvas.vertex(individualPnts[k].x, individualPnts[k].y);
//  }
//  canvas.vertex(individualPnts[0].x, individualPnts[0].y);
//  canvas.endShape();

  canvas.popMatrix();
  }
  
  canvas.endDraw();
  
  canvas.save("syrup" +year()+day()+hour()+minute()+ ".tif");
  image(canvas, 0, 0, canvas.width*.2, canvas.height*.2);

}

void draw() 
{
 
}

