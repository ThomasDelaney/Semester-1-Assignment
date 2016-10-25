class Overwatch_Logo
{
  float x;
  float y;
  int size;

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
    strokeWeight(13);
    strokeCap(SQUARE);
    arc(x, y, size, size, -QUARTER_PI, PI+QUARTER_PI);
    stroke(255, 165, 0);
    arc(x, y, size, size, PI+QUARTER_PI, PI+HALF_PI+QUARTER_PI);
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