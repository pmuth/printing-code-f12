import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

class Pattern 
{

  int numPatterns;
  int numStripes;
  int baseThickness;
  Stripe[] stripes;
  float patternWidth;
  float patternHeight;
  color c;
  Pattern (int _numStripes, int _baseThickness) {
  
    numStripes = _numStripes;
    baseThickness = _baseThickness;
    numPatterns = 3;
    
    float totalThickness = 0;
    
    stripes = new Stripe[numStripes];
    
    chooseRandomPattern();
  
  
  }



void display() {
  
  float totalThickness = 0;
  
  
  while(totalThickness < (canvas.height)) {
  
  for (int i = 0; i < numStripes; i++) {
    
    canvas.fill(stripes[i].c.hue(), stripes[i].c.saturation(), stripes[i].c.brightness());
    float tempThickness = baseThickness * stripes[i].thickness;
    canvas.rect(0, totalThickness, canvas.width*2, tempThickness);
    totalThickness = totalThickness + tempThickness;  
    
  }
  }
}

void getPattern(int number){
  
  int totalThick = 0;
  
     switch(number) {
     case 0:
            while (totalThick != 5) {
      
        int thick01 = int(random(3));
        int thick02 = int(random(3));
        int thick03 = int(random(3));
        totalThick = thick01 + thick02 + thick03;
        
      TColor c = TColor.newHSV((random(1)), (random(1)), (random(1)));
      println(c.hue() + "    " + c.saturation() + "     " + c.brightness());
      stripes[0] = new Stripe(thick01, c.hue(), c.saturation(), c.brightness());
      //c = TColor.newHSV(0.69, 0.12, 0.21);
      c = TColor.newHSV(c.hue()*1.5, c.saturation()*2, c.brightness());
      stripes[1] = new Stripe(thick02, c.hue(), c.saturation(), c.brightness());
      //c = TColor.newHSV(0.00, 0.64, 0.50);
      c = TColor.newHSV(0, c.saturation()*5, c.brightness()*2);
      stripes[2] = new Stripe(thick03, c.hue(), c.saturation(), c.brightness());
      }
      break;
      
//      TColor c = TColor.newHSV((random(1)), (random(1)), (random(1)));
//      println(c.hue() + "    " + c.saturation() + "     " + c.brightness());
//      stripes[0] = new Stripe(3, c.hue(), c.saturation(), c.brightness());
//      //c = TColor.newHSV(0.69, 0.12, 0.21);
//      c = TColor.newHSV(c.hue()*1.5, c.saturation()*2, c.brightness());
//      stripes[1] = new Stripe(3, c.hue(), c.saturation(), c.brightness());
//      //c = TColor.newHSV(0.00, 0.64, 0.50);
//      c = TColor.newHSV(0, c.saturation()*5, c.brightness()*2);
//      stripes[2] = new Stripe(3, c.hue(), c.saturation(), c.brightness());
//      break;
      
      case 1:
      
      TColor c = TColor.newHSV(1, 0.59, 0.32);
      println(c.hue() + "    " + c.saturation() + "     " + c.brightness());
      stripes[0] = new Stripe(2.5, c.hue(), c.saturation(), c.brightness());
      
      TColor d = TColor.newHSV(0.08, 0.86, 0.49);
      stripes[1] = new Stripe(0.5, d.hue(), d.saturation(), d.brightness());
      stripes[2] = new Stripe(0.5, c.hue(), c.saturation(), c.brightness());
      stripes[3] = new Stripe(0.5, d.hue(), d.saturation(), d.brightness());
      stripes[4] = new Stripe(0.5, c.hue(), c.saturation(), c.brightness());
      stripes[5] = new Stripe(0.5, d.hue(), d.saturation(), d.brightness());
      break; 
      
      case 2:
      
      c = TColor.newHSV(0.68, 0.14, 0.31);
      println(c.hue() + "    " + c.saturation() + "     " + c.brightness());
      stripes[0] = new Stripe(3, c.hue(), c.saturation(), c.brightness());
      //c = TColor.newHSV(0.69, 0.12, 0.21);
      d = TColor.newHSV(0.15, 0.59, 0.64);
      stripes[1] = new Stripe(1, d.hue(), d.saturation(), d.brightness());
      //c = TColor.newHSV(0.00, 0.64, 0.50);
      TColor e = TColor.newHSV(0.01, 0.66, 0.46);
      stripes[2] = new Stripe(1, e.hue(), e.saturation(), e.brightness());
      
      
      break;
      
      
//    break;
 }
//  
}

void chooseRandomPattern(){
    getPattern((int)random(numPatterns));
    println("SUCCESS");
  }


 
  
  
  
  
  
}
