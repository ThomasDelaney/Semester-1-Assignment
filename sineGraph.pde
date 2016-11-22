class sineGraph
{
  int borderX = 825;
  float borderY = 200;
  
  float lineX = 825;
  float lineY = 200/1.625;
  
  color c; 
  
  float xspacing = 1;
  float widthOfWave = 400;
  
  float theta = 0.0;
  float heightOfWave;
  float lengthOfWave = 300;
  float dx;
  float[] values;
  float inc;
  
  sineGraph(color c, float heightOfWave, float inc)
  {
    this.inc = inc;
    this.c = c;
    this.heightOfWave = heightOfWave;
    dx = (TWO_PI / lengthOfWave) * xspacing;
    values = new float[int(widthOfWave/xspacing)];
  }
  
  void update()
  {
    theta += inc;
    
    float x = theta;
    for (int i = 0; i < values.length; i++)
    {
      values[i] = sin(x)*heightOfWave;
      x+=dx;
    }
  }
  
  void render() 
  {
    noStroke();
    fill(255);
  
    for (int x = 0; x < values.length; x++) 
    {
      pushMatrix();
      translate(borderX+2, lineY-125);
      noStroke();
      fill(c);
      ellipse(x*xspacing, lineY+values[x], 5, 5);
      popMatrix();
    }
  }
}