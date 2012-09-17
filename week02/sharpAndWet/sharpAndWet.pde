PGraphics canvas;
int canvas_width = 3300;
int canvas_height = 5100;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

void setup()  {
 
 size(canvas_width/4, canvas_height/4);
 
 canvas = createGraphics(canvas_width, canvas_height, P2D);
 calculateResizeRatio();
 canvas.beginDraw();
 canvas.background(255);
 canvas.smooth();
 canvas.fill(0);
  noStroke();  
  
  
  float spikeHeight = canvas.height*.5;
  float numTriangles = 18;
  float sideLength = canvas.width/(numTriangles/2);
  
  
  
  for(int i = 0; i < numTriangles; i++)
  {    
    
    canvas.beginShape();
    //top point
    canvas.vertex(i*sideLength, spikeHeight - (spikeHeight*((numTriangles-i)/numTriangles)));
    
    //bottom right point
    canvas.vertex((i+1)*(sideLength), spikeHeight);
    
    //bottom left point
    canvas.vertex(i*sideLength, spikeHeight);   
 
    canvas.vertex((i+1)*sideLength, canvas.height-spikeHeight);
    canvas.vertex((i+1)*sideLength, canvas.height);
    canvas.vertex(i*sideLength-1, canvas.height);
    canvas.vertex(i*sideLength-1, canvas.height-spikeHeight);
    //sideLength = sideLength;
    
     canvas.endShape();
  } 
   
 canvas.endDraw();
  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;
  
  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

 
 canvas.save("sharpAndWet.png");

}



void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;
  
  if(ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}
