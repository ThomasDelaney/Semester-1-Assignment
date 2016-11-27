class movingLine
{
  float x;
  float y;
  
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