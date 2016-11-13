class Logo
{
  float x;
  float y;
  int size;
  float logoThicknessConst = 7.69230769231;
  boolean withText = false; 
  
  //default constructor
  Logo()
  {
    x = width/2;
    y = height/2;
    size = 80;
    withText = false;
  }

  //parameterised constructor
  Logo(float x, float y, int size, boolean withText)
  {
    this.x = x;
    this.y = y;
    this.size = size;
    this.withText = withText;
  }

  void drawOverwatchLogo(color c)
  {
    noFill();
    stroke(c);
    strokeWeight(size/logoThicknessConst);
    strokeCap(SQUARE);
    arc(x, y, size, size, -QUARTER_PI, PI+QUARTER_PI);
    stroke(255, 165, 0);
    arc(x, y, size, size, PI+QUARTER_PI+(QUARTER_PI/8), PI+HALF_PI+QUARTER_PI-(QUARTER_PI/8));
    
    fill(c);
    noStroke();
    
    beginShape();
    
    vertex(x-convertSize(7), y+convertSize(25));
    vertex(x-convertSize(85), y+convertSize(105));
    vertex(x-convertSize(110), y+convertSize(80));
    vertex(x-convertSize(40), y+convertSize(15));
    vertex(x-convertSize(8), y-convertSize(85));
    vertex(x-convertSize(7), y+convertSize(25));
    
    endShape(CLOSE);
    
    beginShape();
    
    vertex(x+convertSize(7), y+convertSize(25));
    vertex(x+convertSize(85), y+convertSize(105));
    vertex(x+convertSize(110), y+convertSize(80));
    vertex(x+convertSize(40), y+convertSize(15));
    vertex(x+convertSize(8), y-convertSize(85));
    vertex(x+convertSize(7), y+convertSize(25));

    endShape(CLOSE);

  }
  
  void drawAthenaLogo(color o)
  {
    color c = color(255, 140, 0);
    
    strokeWeight(2);
    strokeCap(SQUARE);
    fill(c);   
    stroke(c);
    
    beginShape();
    bezier(x+convertSize(74), y+convertSize(231), x+convertSize(200), y+convertSize(210), x+convertSize(167), y+convertSize(62), x+convertSize(139.5), y+convertSize(110));
    bezier(x+convertSize(291.4), y+convertSize(231), x+convertSize(193.5), y+convertSize(178), x+convertSize(184), y+convertSize(158), x+convertSize(165), y+convertSize(45));
    endShape();
    
    beginShape();
    vertex(x+convertSize(74), y+convertSize(231));
    vertex(x+convertSize(139.5), y+convertSize(110));
    vertex(x+convertSize(165), y+convertSize(45));
    vertex(x+convertSize(163), y+convertSize(-5));
    endShape();
    
    beginShape();
    vertex(x+convertSize(291.4), y+convertSize(231));
    vertex(x+convertSize(165), y+convertSize(45));
    vertex(x+convertSize(163), y+convertSize(-5));
    endShape();
  
    if (withText == true)
    {
      fill(o);  
      textFont(overwatch);
      textSize(150);
      text("Athena", x+convertSize(50), y+convertSize(325));
    }  
  }

   /* function which will take a constant x and y value which I figured out 
     by trial and error to create the two shapes which is in between the arcs,
     I used size 300 which figuring out these constants so that is why I divide
     by 300 to get a number which is divided by the current size givin in the
     constructor to basically map the x and y values given to the size of the 
     logo*/
  float convertSize(float constant)
  {
    float num = 300/constant;
    constant = size /num; 
    return constant;
  }
}