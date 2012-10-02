import geomerative.*;

String charToDraw = "Sippin' On Some Syrup";
float danceFactor = 10;

String title = "Sippin' On Some Syrup";


RFont font;
RGroup grp;
RGroup individualChar; 
RPoint[] pnts;

void setup() 
{
  size(5100/4, 1800/4); 

  smooth();

 
  // always initialize the library in setup
  RG.init(this);
  font = new RFont("FreeSansNoPunch.ttf", 100, RFont.LEFT);

  RCommand.setSegmentLength(25);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  grp = font.toGroup(charToDraw);
  pnts = grp.getPoints();
  
  for (int i = 0; i < charToDraw.length(); i++) {
    
    individualChar=font.toGroup(str(charToDraw.charAt(i)));
    println(individualChar.getWidth());
  }
  
  background(255);
  
   noFill();
  pushMatrix();
  
  // translate to the middle. Use plus in y because text is drawn from y and up
  
  int deadCenterX = int((width / 2) - (grp.getWidth() / 2));
  int deadCenterY = int((height / 2) + (grp.getHeight() / 2));
  
  translate(deadCenterX, deadCenterY);
  println(grp.getWidth());
  //translate(100,100);
  // randomize the points
  for (int i = 0; i < pnts.length; i++ ) {
    pnts[i].x += random(0, danceFactor);
    pnts[i].y += random(0, danceFactor);
  }

  // draw curved lines between points
  strokeWeight(0.08);
  //fill(#9400d3);
  beginShape();
  curveVertex(pnts[pnts.length-1].x, pnts[pnts.length-1].y);
  for (int i=0; i<pnts.length; i=i+1) {
    curveVertex(pnts[i].x, pnts[i].y);
  }
  curveVertex(pnts[0].x, pnts[0].y);
  curveVertex(pnts[1].x, pnts[1].y);
  endShape(); 

  // draw straight lines between points
  strokeWeight(0.1);
  stroke(0);
  /*beginShape();
  for (int i=0; i<pnts.length; i=i+1) {
    vertex(pnts[i].x, pnts[i].y);
  }
  vertex(pnts[0].x, pnts[0].y);
  endShape();*/

  popMatrix();
  
  float fontWidth = textWidth(charToDraw);
  println(fontWidth);
  
}

void draw() 
{
 
}

