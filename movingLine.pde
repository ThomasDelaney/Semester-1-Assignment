class movingLine
{
  float x;
  float y;
  float inc = 1;
  
  void drawLine()
  {
    line (x, y, x-30, y);
    y += 2;
    
    if (y >= height)
    {
      y = 0;
    }
  }
}