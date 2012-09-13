PGraphics canvas;
int canvas_width = 2480;
int canvas_height = 3508;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

void setup()  {
 
 size(640, 880);
 
 canvas = createGraphics(canvas_width, canvas_height, P2D);
 calculateResizeRatio();
 canvas.beginDraw();
 canvas.background(255);
   int sizeofCone = 3;
   color coneColor = 0; 
   canvas.fill(coneColor);
     
 
 for (int i = 0; i < sizeofCone; i++) {
 
   switch(i) {
     case 0:
         //Draw white rectangle on the bottom
         coneColor = 0;
         canvas.fill(coneColor);
         canvas.rect(0, 0, canvas.width, canvas.height/2);
         break;

    case 1:
        //Draw three scoops of ice cream
        coneColor = 255;
        canvas.fill(coneColor);
        canvas.noStroke();
        float scoopX = 0; 
        float scoopY = 0;
        float scoopDiameter = 0;
        int numberOfScoops = 3;
        for (int j = 0; j < 3; j++) {
          switch(j) {
          case 0:
                 scoopX = 320/ratio;
                 scoopY = 360/ratio;
                 scoopDiameter = 254/ratio;
                 break;
          case 1:
                 scoopX = 320/ratio;
                 scoopY = 260/ratio;
                 scoopDiameter = 254/ratio;
                 break;
          case 2: 
                 scoopX = 320/ratio;
                 scoopY = 160/ratio;
                 scoopDiameter = 254/ratio;
                 break;    
          }
            canvas.ellipse(scoopX, scoopY, scoopDiameter, scoopDiameter);
            println(j);
            
        }
          break;
        
     case 2:
       //Draw cone
       coneColor = 0;
       canvas.fill(coneColor);
       canvas.noStroke();
       canvas.triangle(220/ratio, 440/ratio, 420/ratio, 440/ratio, 320/ratio, 832/ratio);

       break;
     
   }
   
 canvas.endDraw();
  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;
  
  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

 
 canvas.save("icecream.png");

}

}

void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;
  
  if(ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}
