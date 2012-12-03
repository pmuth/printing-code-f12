class ModularGrid
{
  
  int cols;
  int rows;
  float gutterSize;
  float pageMargin;
  Module[][] modules;
  float moduleWidth;
  float moduleHeight;
  
  ModularGrid(int _cols, int _rows, float _gutterSize, float _pageMargin)
  {
    cols = _cols;
    rows = _rows;
    gutterSize = _gutterSize;
    pageMargin = _pageMargin;
    
    modules = new Module[cols][rows];
    
    float actualPageWidth = ((float)canvas.width - (2*pageMargin));
    
    float totalGutterWidth = (cols-1) * gutterSize;
    
    moduleWidth = (actualPageWidth - totalGutterWidth) / (float)cols;
    
    float actualPageHeight = ((float)canvas.height - (2*pageMargin));
    float totalGutterHeight = (rows-1) * gutterSize;
    moduleHeight = (actualPageHeight - totalGutterHeight) / (float)rows;
    
    for (int i = 0; i < cols; i++) 
    {
      for (int j = 0; j < rows; j++)
      {
        modules[i][j] = new Module();
        modules[i][j].x = pageMargin + (i*moduleWidth) + (i*gutterSize);
        modules[i][j].y = pageMargin + (j*moduleHeight) + (j*gutterSize);
        modules[i][j].w = moduleWidth;
        modules[i][j].h = moduleHeight;
      }
    }
  }    
  
  void display()
  {
    canvas.noFill();
    canvas.stroke(255, 0, 0 , 100);
    
    //canvas.rect(pageMargin, pageMargin, canvas.width - (2*pageMargin), canvas.height - (2*pageMargin));
    
    String[] makerbot = new String[8];
    makerbot[0] = "M";
    makerbot[1] = "a";
    makerbot[2] = "k";
    makerbot[3] = "e";
    makerbot[4] = "r";
    makerbot[5] = "B";
    makerbot[6] = "o";
    makerbot[7] = "t";
    int counter = 0;
    int printLetter = 0;
    
    int[] a  = new int[8];
    for (int i=0; i<a.length; i++) {
      a[i] = i;
    }
    int[] a2 = new int[8];
    arrayCopy(a, a2);
    randomize(a2);
    
    boolean correct = false;
    
    
//    for (int i = 0; i < 8; i++) 
//    {
//      println(a2[i]);
//    }
    
    for (int i = 0; i < cols; i=i+2) 
    {
      for (int j = 0; j < rows; j++)
      {
        
        if (Arrays.equals(a, a2))
            canvas.fill(255,14,19);
            else
            canvas.fill(255);
        
        //canvas.fill(255);
        //canvas.rect(modules[i][j].x, modules[i][j].y, modules[i][j].w, modules[i][j].h);
        //canvas.fill(135);
        
        canvas.textFont(DesignerBlock, 100);
        printLetter=counter%8;
        int printNumber = a2[printLetter];
        canvas.text(makerbot[printNumber], modules[j][i].x, modules[j][i].y+modules[j][i].h);
        
        counter++;
        
        if (counter%8 == 0)
        
        {
          
          WeightedRandomSet<String> correctNotCorrect = new WeightedRandomSet<String>();
          
          correctNotCorrect.add("CORRECT", 20);
          correctNotCorrect.add("NOTCORRECT", 80);
          
          if (correctNotCorrect.getRandom() == "CORRECT" && correct == false)
            {
            arrayCopy(a, a2); 
            correct = true;
            }
          else 
             {
                randomize(a2);
                correct = false;
        }
        
println(printNumber);      
    }
  }
  
  }
  } 
  void randomize (int[] arrMy) {
  for (int k=0; k < arrMy.length; k++) {
    // Goal: swap the value at pos k with a rnd value at pos x.
    // Make rnd index x
    int x = (int)random(0, arrMy.length);     
    // swap pos k and x 
    arrMy = swapValues(arrMy, k, x);
  } // for
  // display(a, 39);
  // return arrMy;
} // func
//
int[] swapValues (int[] myArray, int a, int b) {
  // Goal: swap the value at pos a with a value at pos b in 
  // Array myArray, return the changed array.  
  // save current value from pos/index a into temp
  int temp=myArray[a];
  // overwrite value at current pos a with value at index b
  myArray[a]=myArray[b];
  // finish swapping by giving the old value at pos a to the 
  // pos b. 
  myArray[b]=temp;
  // return the changed array
  return myArray;
}
  
}
    
    
