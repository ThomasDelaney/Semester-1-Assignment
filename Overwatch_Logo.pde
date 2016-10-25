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
    PShape Logo = createShape(GROUP);
    PShape arc1 = createShape();
    float sizeFactor = size/2.8;
    float subFactor = size/7.4;

    arc1.beginShape();

    arc1.noFill();
    arc1.stroke(255);
    arc1.vertex(x, y);
    arc1.bezierVertex(x, y, x+25, y-25, x-25, y-25);

    arc1.endShape(CLOSE);
    shape(arc1);
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