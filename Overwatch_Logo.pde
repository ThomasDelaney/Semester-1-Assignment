class Overwatch_Logo
{
  float x;
  float y;
  int size;
  float logoThicknessConst = 7.69230769231;
  color c;

  //default constructor
  Overwatch_Logo()
  {
    setX(width/2);
    setY(height/2);
    setSize(80);
  }

  //parameterised constructor
  Overwatch_Logo(float x, float y, int size, color c)
  {
    this.x = x;
    this.y = y;
    this.size = size;
    this.c = c;
  }

  void drawLogo()
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
    strokeWeight(1);
    
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
  

  //getters and setters for class fields
  float getX()
  {
    return x;
  }

  void setX(float x)
  {
    this.x = x;
  }

  float getY()
  {
    return y;
  }

  void setY(float y)
  {
    this.y = y;
  }

  int getSize()
  {
    return size;
  }

  void setSize(int size)
  {
    this.size = size;
  }
}