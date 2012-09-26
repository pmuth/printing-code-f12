
import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;



PGraphics canvas;
int canvas_width = 3300;  
int canvas_height = 5100; 
float cutter = 0.18;

float rectSize = 40;

void setup() {
  size( int( canvas_width*cutter ), int( canvas_height*cutter ) );
  canvas = createGraphics( canvas_width, canvas_height, P2D);

 
  canvas.beginDraw();
  canvas.colorMode( HSB, 1, 1, 1 );
  canvas.noStroke();
  
  int xSquares = canvas_width/100;
  int ySquares = canvas_height/100;
  
  
  float musicInterest   = 0.315;
  float sportsInterest  = 0.235;
  float movieInterest   = 0.29;
  float bookInterest    = 0.16;
  
  int squareSize = 100;
  
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
  TColor twoThousandOne  = TColor.newHSV(0, 0.99, 0.73);
  TColor oscarWao        = TColor.newHSV(0, 0.64, 0.89 );
  
  
   ColorList blueprintList = ColorList.createUsingStrategy(monochromeTheoryStrategy, blueprint); 
   ColorList celticsList;
   ColorList twoThousandOneList;
   ColorList oscarWaoList;



  
  for (int i = 0; i < 33; i++) {
    for (int j = 0; j < 51; j++) {
       
      
     
      int individualSquare = (j*33)+i;
      println(individualSquare);     
       if ( individualSquare <= (tier1) ) {
       canvas.fill(blueprint.hue(), blueprint.saturation(), blueprint.brightness());
      
    }
       
     else if (individualSquare <= tier2) {
       
       canvas.fill(celtics.hue(), celtics.saturation(), celtics.brightness());
       
     }
     
     else if (individualSquare <= tier3) {
      
        canvas.fill(twoThousandOne.hue(), twoThousandOne.saturation(), twoThousandOne.brightness());
       
     }
     
     else if (individualSquare <= tier4) 
     
     {
          
       canvas.fill(oscarWao.hue(), oscarWao.saturation(), oscarWao.brightness());
       
     }
        
         canvas.rect(i*squareSize,j*squareSize, 100,100);
  
    }
  }

  
  
         println(totalSquares);
         println(tier1);
         println(tier2);
         println(tier3);
         println(tier4);
  
  canvas.endDraw();
  //canvas.save("portrait10.tif");
  image( canvas, 0, 0, width, height) ;

}
