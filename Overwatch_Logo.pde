class Overwatch_Logo
{
  float x;
  float y;
  int size;
  float logoThicknessConst = 7.69230769231;

  //default constructor
  Overwatch_Logo()
  {
    setX(width/2);
    setY(height/2);
    setSize(80);
  }

  //parameterised constructor
  Overwatch_Logo(float x, float y, int size)
  {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void drawLogo()
  {
    noFill();
    stroke(100);
    strokeWeight(size/logoThicknessConst);
    strokeCap(SQUARE);
    arc(x, y, size, size, -QUARTER_PI, PI+QUARTER_PI);
    stroke(255, 165, 0);
    arc(x, y, size, size, PI+QUARTER_PI+(QUARTER_PI/8), PI+HALF_PI+QUARTER_PI-(QUARTER_PI/8));
    
    fill(100);
    noStroke();
    strokeWeight(1);
    beginShape();
    
    vertex(x-85, y+105);
    vertex(x-7, y+25);
    vertex(x-110, y+80);
    vertex(x-40, y+15);
    vertex(x-40, y+15);
    vertex(x-8, y-85);
    vertex(x-7, y+25);
    vertex(x-8, y-85);
    
    //line(x-85, y+105, x-7, y+25);
    //line(x-110, y+80, x-40, y+15);
    //line(x-40, y+15, x-8, y-85);
    //line(x-7, y+25, x-8, y-85);
    
    //line(x+85, y+105, x+7, y+25);

    endShape(CLOSE);

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