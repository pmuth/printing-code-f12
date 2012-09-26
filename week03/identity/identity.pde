
import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

PGraphics canvas;
int canvas_width = 3300;  
int canvas_height = 5100; 
float cutter = 0.18;

void setup() {
  size( int( canvas_width*cutter ), int( canvas_height*cutter ) );
  canvas = createGraphics( canvas_width, canvas_height, P2D);

 
  canvas.beginDraw();
  canvas.colorMode( HSB, 1, 1, 1 );
  //canvas.noStroke;
  
    int squareSize = 100;
  
  int xSquares = canvas_width/squareSize;
  int ySquares = canvas_height/squareSize;
  
  float totalInterest   = 0;
  float musicInterest   = 0;
  float sportsInterest  = 0;
  float movieInterest   = 0;
  float bookInterest    = 0;
  
  while (totalInterest != 1.0) {
  
    /*
  float musicInterest   = 0.315;
  float sportsInterest  = 0.235;
  float movieInterest   = 0.29;
  float bookInterest    = 0.16;
  */
  
  musicInterest   = random(0.20, 0.5);
  sportsInterest  = random(0.20, 0.5);
  movieInterest   = random(0.20, 0.5);
  //bookInterest    = 0.12;
  totalInterest   = musicInterest + sportsInterest + movieInterest + bookInterest;

  }

  
  int totalSquares = (canvas_width/squareSize)*(canvas_height/squareSize);
  
  int musicSquares = int(musicInterest*totalSquares);
  int sportsSquares = int(sportsInterest*totalSquares);
  int movieSquares = int(movieInterest*totalSquares);
  int bookSquares = int(bookInterest*totalSquares);
  
  int tier1 = musicSquares;
  int tier2 = tier1 + sportsSquares;
  int tier3 = tier2 + movieSquares;
  int tier4 = tier3 + bookSquares;
  
  
  println(totalSquares);
  
  TColor blueprint       = TColor.newHSV(0.59, 0.31, 0.61);
  TColor celtics         = TColor.newHSV(0.425, 1, 0.51);
  TColor twoThousandOne = TColor.newHSV(0,0,0);
  //TColor twoThousandOne  = TColor.newHSV(0, 0.99, 0.73);
  TColor oscarWao        = TColor.newHSV(0, 0.64, 0.89 );
  
  
  ColorTheoryStrategy s = new MonochromeTheoryStrategy();
  ColorList blueprintList = ColorList.createUsingStrategy(s, blueprint);
  ColorList celticsList = ColorList.createUsingStrategy(s, celtics);
  ColorList twoThousandOneList = ColorList.createUsingStrategy(s, twoThousandOne);
  ColorList oscarWaoList = ColorList.createUsingStrategy(s, oscarWao);
  
  for (int i = 0; i < xSquares; i++) {
    for (int j = 0; j < ySquares; j++) {
       
      
     
      int individualSquare = (j*xSquares)+i;
      println(individualSquare);     
       if ( individualSquare <= (tier1) ) {
       
        ReadonlyTColor c = blueprintList.getRandom();       
        canvas.fill(c.hue(), c.saturation(), c.brightness());
      
    }
       
     else if (individualSquare <= tier2) {
       
               ReadonlyTColor c = celticsList.getRandom();       
        canvas.fill(c.hue(), c.saturation(), c.brightness());       
     }
     
     else if (individualSquare <= tier3) {
      
        ReadonlyTColor c = twoThousandOneList.getRandom();       
        canvas.fill(c.hue(), c.saturation(), c.brightness());
       
     }
     
     else if (individualSquare <= tier4) 
     
     {
          
        ReadonlyTColor c = oscarWaoList.getRandom();       
        canvas.fill(c.hue(), c.saturation(), c.brightness());
       
     }
        
         canvas.rect(i*squareSize,j*squareSize, squareSize, squareSize);
  
    }
  }

  
  /*
         println(totalSquares);
         println(tier1);
         println(tier2);
         println(tier3);
         println(tier4);
  */
  
  println(musicInterest + "    " + sportsInterest + "    "  + movieInterest + "     " + bookInterest);
  
  
  canvas.endDraw();
  canvas.save("identity" +year()+day()+hour()+minute()+ ".tif");
  image( canvas, 0, 0, width, height) ;

}
