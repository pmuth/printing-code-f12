import geomerative.*;

String charToDraw = "Grindin'";
float danceFactor = 10;

String title = "Sippin' On Some Syrup";


RFont font;

RGroup grp;
RPoint[] pnts;

RGroup individualChar; 
RPoint[] individualPnts;

void setup() 
{
  size(5100/4, 1800/4); 

  smooth();
  
  int[] charWidth = new int[charToDraw.length()];
 
  // always initialize the library in setup
  RG.init(this);
  font = new RFont("FreeSansNoPunch.ttf", 90, RFont.LEFT);

  RCommand.setSegmentLength(25);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  //Get points/width for entire string
  grp = font.toGroup(charToDraw);
  pnts = grp.getPoints();
  
  
  //Determine width of each character
  for (int i = 0; i < charToDraw.length(); i++) {
    
    individualChar=font.toGroup(str(charToDraw.charAt(i)));
    
//    if (individualChar.getWidth() < 0) {
//      charWidth[i] = 20; 
//  }
//    else {
//      charWidth[i] = int(individualChar.getWidth());
//  }   


    charWidth[i] = int(individualChar.getWidth());

 println(charWidth[i]);  

}
    

  background(255);
  
  noFill();
  
  // translate to the middle. Use plus in y because text is drawn from y and up
  
  int deadCenterX = int((width / 2) - (grp.getWidth() / 2))-25;
  int deadCenterY = int((height / 2) + (grp.getHeight() / 2));
  
  //translate(deadCenterX, deadCenterY);

  
// randomize the points
  
  
  for (int i = 0; i < charToDraw.length(); i++) {
      pushMatrix();
    //individualChar=font.toGroup(" ");
    individualChar=font.toGroup(str(charToDraw.charAt(i)));
    individualPnts = individualChar.getPoints();

    //individualPnts = individualChar.getPoints();
  
  
  
  
  
    translate(deadCenterX, deadCenterY);
    

  
    for (int j = 0; j < individualPnts.length; j++ ) {
      individualPnts[j].x += random(0, danceFactor);
      individualPnts[j].y += random(0, danceFactor);
    }

  // draw curved lines between points
  strokeWeight(0.08);
  fill(#9400d3);
  beginShape();
  curveVertex(individualPnts[individualPnts.length-1].x, individualPnts[individualPnts.length-1].y);
  for (int k=0; k<individualPnts.length; k=k+1) {
    curveVertex(individualPnts[k].x, individualPnts[k].y);
  }
  curveVertex(individualPnts[0].x, individualPnts[0].y);
  curveVertex(individualPnts[1].x, individualPnts[1].y);
  endShape(); 

  
  deadCenterX = deadCenterX+charWidth[i]+10; 
  
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
  }
  float fontWidth = textWidth(charToDraw);
  println(fontWidth);
  
}

void draw() 
{
 
}

