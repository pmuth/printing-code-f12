import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

class Stripe 
{
   float thickness;
   float h;
   float s;
   float b;
   TColor c;
   //TColor stripeColor;
  
   Stripe(float _thickness, float _h, float _s, float _b) {
 
    thickness = _thickness;
    h = _h;
    s = _s;
    b = _b;
   }
   
   void setH (int number) {
    
    h = number; 
     
   }
   
}
