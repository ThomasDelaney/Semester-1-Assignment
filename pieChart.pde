class pieChart
{
  float theta = 2;
  float lastAngle = 0;
  float x = 1000;
  float y = 400;
  float diameter = 250;
  
  void drawChart()
  {
    fill(255, 0, 0);
    textFont(overwatch);
    textSize(20);
    stroke(255);
    
    fill(255, 0, 0);
    arc(x, y, diameter, diameter, lastAngle, lastAngle+theta, PIE);
    
    fill(0, 255, 0);
    arc(x, y, diameter, diameter, lastAngle+theta, lastAngle+(theta+1.7), PIE);
    
    fill(0, 0, 255);
    arc(x, y, diameter, diameter, lastAngle+(theta+1.7), lastAngle+(theta+2.7), PIE);
    
    fill(255, 255, 0);
    arc(x, y, diameter, diameter, lastAngle+(theta+2.7),lastAngle+(theta+4.3), PIE);
    
    lastAngle += theta/35;
  }
}