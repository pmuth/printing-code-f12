import toxi.geom.*;
import toxi.util.datatypes.*;


PGraphics canvas;
int canvas_width = 3300;  
int canvas_height = 5100; 
float cutter = 0.2;

PVector quad1A;
PVector quad1B;
PVector quad2A;
PVector quad2B;
PVector quad3A;
PVector quad3B;
PVector quad4A;
PVector quad4B;
PVector quad5A;
PVector quad5B;

void setup() {
  size( int( canvas_width*cutter ), int( canvas_height*cutter ) );
  canvas = createGraphics( canvas_width, canvas_height, P2D);  

  quad1A = new PVector(canvas_width/3, (5*canvas_height)/6); 
  quad1B = new PVector((2*canvas_width)/3, canvas_height);
  
  quad2A = new PVector(0, canvas_height/3);
  quad2B = new PVector(canvas_width/3, (2*canvas_height)/3);
  
  quad3A = new PVector(canvas_width/3, 0);
  quad3B = new PVector((5*canvas_width)/6, canvas_height/6);
  
  quad4A = new PVector((5*canvas_width)/6, canvas_height/6);
  quad4B = new PVector(canvas_width, (2*canvas_height)/3);
  
  quad5A = new PVector(canvas_width/2, canvas_height/3);
  quad5B = new PVector((5*canvas_width)/6, (2*canvas_height)/3);
  
  canvas.beginDraw();

  canvas.background(255);
  canvas.smooth();
  canvas.noFill();
  //canvas.stroke();
  canvas.strokeWeight(25);

WeightedRandomSet<String> colors = new WeightedRandomSet<String>();

colors.add("RED", 45);
colors.add("BLUE", 30);
colors.add("GREEN", 25);
  
  canvas.rect(quad1A.x, quad1A.y, quad1B.x-quad1A.x, quad1B.y-quad1A.y);
  canvas.rect(quad2A.x, quad2A.y, quad2B.x-quad2A.x, quad2B.y-quad2A.y);
  canvas.rect(quad3A.x, quad3A.y, quad3B.x-quad3A.x, quad3B.y-quad3A.y);
  canvas.rect(quad4A.x, quad4A.y, quad4B.x-quad4A.x, quad4B.y-quad4A.y);
  canvas.rect(quad5A.x, quad5A.y, quad5B.x-quad5A.x, quad5B.y-quad5A.y);
  int numLines = 8;
  int pointNum = 5;
  int pointWidth = canvas.width / pointNum;
     
   for (int i = 0; i < numLines; i++) {

      colors.getRandom();
  ArrayList<Vec2D> points = new ArrayList();
  Vec2D p1 = new Vec2D(random(quad1A.x, quad1B.x), random(quad1A.y, quad1B.y));
  points.add(p1);
  Vec2D p2 = new Vec2D(random(quad2A.x, quad2B.x), random(quad2A.y, quad2B.y));
  points.add(p2);
  Vec2D p3 = new Vec2D(random(quad3A.x, quad3B.x), random(quad3A.y, quad3B.y));
  points.add(p3);
  Vec2D p4 = new Vec2D(random(quad4A.x, quad4B.x), random(quad4A.y, quad4B.y));
  points.add(p4);
  Vec2D p5 = new Vec2D(random(quad5A.x, quad5B.x), random(quad5A.y, quad5B.y));
  points.add(p5);

  Spline2D spline = new Spline2D(points);

  ArrayList<Vec2D> morePoints = (ArrayList) spline.computeVertices(14);
  
//  canvas.beginShape();
//
//  String colorSelection = colors.getRandom();
//  
//  if (colorSelection == "RED") {
//    canvas.stroke(255, 37, 5);
//  }
//  else if (colorSelection == "GREEN") 
//    canvas.stroke(43, 121, 81);
//  else 
//    canvas.stroke(27, 129, 214);  
//  for(int j = 0; j < morePoints.size(); j++) 
//  {
//    Vec2D p = morePoints.get(j);
//    canvas.vertex(p.x, p.y);
//  }
//  canvas.endShape();

   


  canvas.beginShape();
  for (int j = 0; j < points.size(); j++) {

    Vec2D p = points.get(j);
    canvas.vertex(p.x, p.y);
    canvas.ellipse(p.x, p.y, 25*j, 25*j);
}
  canvas.endShape();
}

  canvas.endDraw();
  canvas.save("olivetti" +year()+day()+hour()+minute()+ ".tif");
  image( canvas, 0, 0, width, height );
}

