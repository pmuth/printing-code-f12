import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

class Stripe 
{
   float thickness;
   TColor c;
   //TColor stripeColor;
  
   Stripe(float _thickness, float _h, float _s, float _b) {
 
    thickness = _thickness;
    c = TColor.newHSV(_h, _s, _b);
     
   }
   
}
