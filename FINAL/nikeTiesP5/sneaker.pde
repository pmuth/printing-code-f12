import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

class Sneaker 
{
  
  int sneakerNumber;
  
  ColorList colors = new ColorList();
  
  Sneaker(int _sneakerNumber) {
    
    sneakerNumber = _sneakerNumber;
    //colors = new ArrayList(); 
 
    getSneaker(sneakerNumber);   
  }
  
  void getSneaker(int number) {
    
    switch(number) {
   
    case 0:
        
        colors.add(TColor.newHSV(0.997, 0.99, 0.64));
        colors.add(TColor.newHSV(0.638, 0.02, 0.50));
        colors.add(TColor.newHSV(0, 0, 0));
        break;
      
    
        
  }
  
  }
  
  
}
