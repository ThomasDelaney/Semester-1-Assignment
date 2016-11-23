class pieChart
{
  float theta = 2;
  float lastAngle = 0;
  float centerX = 1000;
  float centerY = 415;
  float radius = 250;
  
  void drawChart()
  {
    fill(255, 0, 0);
    textFont(overwatch);
    textSize(25);
    stroke(255);
    strokeWeight(3);
  
    float x1 = (centerX) + sin(lastAngle + (theta * 0.5f) + HALF_PI) * radius/3.5;      
    float y1 = (centerY) - cos(lastAngle + (theta * 0.5f) + HALF_PI) * radius/3.5;
    
    fill(255, 0, 0);
    arc(centerX, centerY, radius, radius, lastAngle, lastAngle+theta, PIE);
    
    float x2 = (centerX-20) + sin((lastAngle+theta) + (theta * 0.35f) + HALF_PI) * radius/3.5;      
    float y2 = (centerY+10) - cos((lastAngle+theta) + (theta * 0.35f) + HALF_PI) * radius/3.5;
    
    fill(0, 255, 0);
    arc(centerX, centerY, radius, radius, lastAngle+theta, lastAngle+(theta+1.7), PIE);
    
    float x3 = (centerX-10) + sin((lastAngle+(theta+1.7)) + (theta * 0.2f) + HALF_PI) * radius/3.25;      
    float y3 = (centerY) - cos((lastAngle+(theta+1.7)) + (theta * 0.2f) + HALF_PI) * radius/3.25;
    
    fill(0, 0, 255);
    arc(centerX, centerY, radius, radius, lastAngle+(theta+1.7), lastAngle+(theta+2.7), PIE);
    
        
    float x4 = (centerX) + sin((lastAngle+(theta+2.7)) + (theta * 0.4f) + HALF_PI) * radius/3.5;      
    float y4 = (centerY) - cos((lastAngle+(theta+2.7)) + (theta * 0.4f) + HALF_PI) * radius/3.5;
    
    fill(255, 255, 0);
    arc(centerX, centerY, radius, radius, lastAngle+(theta+2.7),lastAngle+(theta+4.3), PIE);
    
    fill(255);
    text("B.P", x1, y1);
    text("Power", x2, y2);
    text("B.R", x3, y3);
    text("B.A", x4, y4);
    
    lastAngle += theta/25;
    
    if (lastAngle >= 2*PI)
    {
      lastAngle = 0;
    }
  }
}