void setup()  {
 
 size(640, 880); 

   int sizeofCone = 3;
   color coneColor = 0; 
   fill(coneColor);
   background(255);  
 
 for (int i = 0; i < sizeofCone; i++) {
 
   switch(i) {
     case 0:
         //Draw white rectangle on bottom half
         coneColor = 0;
         fill(coneColor);
         rect(0, 0, width, height/2);
         break;

    case 1:
        //Draw three ice cream scoops
        coneColor = 255;
        fill(coneColor);
        noStroke();
        int scoopX = 0; 
        int scoopY = 0;
        int scoopDiameter = 0;
        int numberOfScoops = 3;
        for (int j = 0; j < 3; j++) {
          switch(j) {
          case 0:
                 scoopX = 320;
                 scoopY = 360;
                 scoopDiameter = 254;
                 break;
          case 1:
                 scoopX = 320;
                 scoopY = 260;
                 scoopDiameter = 254;
                 break;
          case 2: 
                 scoopX = 320;
                 scoopY = 160;
                 scoopDiameter = 254;
                 break;       
          }
            ellipse(scoopX, scoopY, scoopDiameter, scoopDiameter);
            println(j);
            
        }
          break;
        
     case 2:
       //Draw ice cream cone
       coneColor = 0;
       fill(coneColor);
       noStroke();
       triangle(220, 440, 420, 440, 320, 832);
       break;

      
   }
   
 
 println(coneColor);
 
}

}

