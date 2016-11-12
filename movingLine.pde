class movingLine
{
  float x;
  float y;
  float inc = 1;
  
  movingLine()
  {
    
  }
  
  void drawLine()
  {
    line (x, y, x-30, y);
    y += 2;
    
    if (y >= height)
    {
      y = 0;
    }
  }
  
  void setX(float x)
  {
    this.x = x;
  }
  
  void setY(float y)
  {
    this.y = y;
  }
}