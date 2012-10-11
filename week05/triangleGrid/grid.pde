
import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

class ModularGrid
{
  int cols;
  int rows;
  float gutterSize;
  float pageMargin;
  Module[][] modules;
  Module[][] modules2;
  float moduleWidth;
  float moduleHeight;
  //HSBColor color1 = new HSBColor(0, 100, 100);
  float originalHue = 0.7;
  float originalBrightness = 0.5;
  float originalSaturation = 0.5;
  float adjustedHue=0;
  float adjustedBrightness=0;
  float adjustedSaturation=0;
  
  ModularGrid(int _cols)
  {
    cols = _cols;
    rows = _cols;
    
    canvas.colorMode(HSB, 1, 1, 1);
 
    
    modules = new Module[cols][rows];
    //modules2 = new Module[cols][rows];
    
    moduleWidth = canvas.width/cols; 
    rows = cols;
    println(moduleWidth);
    
    for(int i = 0; i < cols; i++)
    {
      for(int j = 0; j < rows; j++)
      {

        if (j%2==0) 
        {      
        modules[i][j] = new Module();
        modules[i][j].x1 = (i*moduleWidth);
        modules[i][j].y1 = (j*moduleWidth);
        modules[i][j].x2 = ((i+1)*moduleWidth);
        modules[i][j].y2 = ((j+1)*moduleWidth);
        modules[i][j].x3 = (i*moduleWidth);
        modules[i][j].y3 = ((j+1)*moduleWidth);
        }
        
        else if (j%2 == 1)
        {      
        modules[i][j] = new Module();
        modules[i][j].x1 = ((i)*moduleWidth);
        modules[i][j].y1 = (j*moduleWidth);
        modules[i][j].x2 = ((i+1)*moduleWidth);
        modules[i][j].y2 = ((j)*moduleWidth);
        modules[i][j].x3 = ((i+1)*moduleWidth);
        modules[i][j].y3 = ((j+1)*moduleWidth);
        }
  }
  }
  }
  
  void display()
  {
    //canvas.stroke(255, 0, 0, 50);
   
    // draw all modules
    for(int i = 0; i < cols; i++)
    {
      for(int j = 0; j < rows; j++)
      {
        
        adjustedHue = originalHue+((1-originalHue)*(i/cols));
        adjustedSaturation = originalSaturation+( (1-originalSaturation) * ( (i*j) / (cols*rows)));
        adjustedBrightness = originalBrightness+((1-originalBrightness)*(j/rows));
        //adjustedHue = originalHue;
        //adjustedSaturation = originalSaturation;
        //adjustedBrightness = originalBrightness;
        
        canvas.fill(adjustedHue, adjustedSaturation, adjustedBrightness);
          
        canvas.triangle(modules[i][j].x1, modules[i][j].y1, modules[i][j].x2, modules[i][j].y2, modules[i][j].x3, modules[i][j].y3);
      } 
    }
  }
  
 void displayGrid() {
   
       canvas.stroke(255, 0, 0, 50);
   
    // draw all modules
    for(int i = 0; i < cols; i++)
    {
      for(int j = 0; j < rows; j++)
      {
        
        //canvas.fill(adjustedHue, adjustedSaturation, adjustedBrightness);
        canvas.stroke(1, 0, 0);  
        canvas.triangle(modules[i][j].x1, modules[i][j].y1, modules[i][j].x2, modules[i][j].y2, modules[i][j].x3, modules[i][j].y3);
      } 
    }
  }
   
 }

