import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

class Pattern 
{
  
  int patternNumber;
  int baseThickness;
  
  ArrayList stripes;
  
  
  Pattern (int _baseThickness) {
  
  baseThickness = _baseThickness;
 
  stripes = new ArrayList();
   
  addStripe();
  addStripe(); 
  addStripe();
  //getPattern(patternNumber);
  
}


void addStripe() {
 
   stripes.add(new Stripe(1, (random(1)), (random(1)), (random(1)))); 
   println("SUCCESS");
}

void display() {
  
  float totalThickness = 0;
  
  while (totalThickness < canvas.width) {
   
   for (int i = 0; i < stripes.size(); i++) {
     
     Stripe tempStripe = (Stripe) stripes.get(i);
     TColor tempColor = TColor.newHSV(tempStripe.h, tempStripe.s, tempStripe.b);
     canvas.fill(tempColor.hue(), tempColor.saturation(), tempColor.brightness());
     float stripeThickness = baseThickness * tempStripe.thickness;
     canvas.rect(totalThickness, 0, stripeThickness, canvas.height);
     totalThickness = totalThickness + stripeThickness;
     
   } 
    
  }
  
}

}
