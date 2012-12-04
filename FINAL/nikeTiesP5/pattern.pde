import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

class Pattern 
{
  
  int patternNumber;
  int baseThickness;
  
  ArrayList<Stripe> stripes;
  
  Pattern (int _baseThickness) {
  
  baseThickness = _baseThickness;
 
  stripes = new ArrayList<Stripe>();
  
}


void addStripe() {
 
   stripes.add(new Stripe(1, (random(1)), (random(1)), (random(1)))); 
   println("SUCCESS");
}

void removeStripe(int number) {
  
  int lastStripe = number;
  stripes.remove(lastStripe);
  
}

void changeStripeColor(int number) {
 
  //stripes.get(number).Stripe.setH(random(1));
  Stripe temp = stripes.get(number);
  temp.h = random(0,1);
  temp.s = random(0,1);
  temp.b = random(0,1);
  
// stripes.get(number).h = random(1);
// Stripe tempStripe = (Stripe) stripes.get(number);
// tempStripe.h = random(1);
// tempStripe.s = random(1);
// tempStripe.b = random(1);
 //stripes.get(number) = tempStripe;
  
}

void changeThickness(int number, int thickness) {
 
  Stripe temp = stripes.get(number);
  temp.thickness = thickness;
  println(temp.thickness);
  
}

int getSize () {
 
  int numStripes = stripes.size()-1;
  return numStripes;
  
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
