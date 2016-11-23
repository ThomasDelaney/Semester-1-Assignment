class barChart
{
  float barLineX = 35;
  float barLineY = 700;
  
  float barGoal1 = (int)random(1, 800);
  float barWidth1 = (int)random(1, 800);
  
  float barGoal2 = (int)random(1, 800);
  float barWidth2 = (int)random(1, 800);
  
  float barGoal3 = (int)random(1, 800);
  float barWidth3 = (int)random(1, 800);
  
  float barGoal4 = (int)random(1, 800);
  float barWidth4 = (int)random(1, 800);
  
  void drawBars()
  {
    barWidth1 = checkBarWidth(barWidth1, barGoal1);
    if (barWidth1 == barGoal1)
    {
      barGoal1 = (int)random(1, 800);
    }
    
    barWidth2 = checkBarWidth(barWidth2, barGoal2);
    if (barWidth2 == barGoal2)
    {
      barGoal2 = (int)random(1, 800);
    }
    
    barWidth3 = checkBarWidth(barWidth3, barGoal3);
    if (barWidth3 == barGoal3)
    {
      barGoal3 = (int)random(1, 800);
    }
    
    
    barWidth4 = checkBarWidth(barWidth4, barGoal4);
    if (barWidth4 == barGoal4)
    {
      barGoal4 = (int)random(1, 800);
    }
    
   
    noStroke();
    fill(255, 0, 0);
    rectMode(CORNER);
    
    rect(barLineX, barLineY-40, barWidth1, 32);
    
    fill(0, 255, 0);
    rect(barLineX, barLineY-90, barWidth2, 32);
    
    fill(0, 0, 255);
    rect(barLineX, barLineY-140, barWidth3, 32);
    
    fill(255, 255, 0);
    rect(barLineX, barLineY-190, barWidth4, 32);
    
    strokeWeight(3);
    stroke(255);
    line (barLineX, barLineY, barLineX, barLineY-200);
  }
  
  float checkBarWidth(float w, float g)
  {
    if (w != g)
    {  
      if (w > g)
      {
        w -= 1;
      }
      else if (w < g)
      {
        w += 1;
      }
    }
    return w;
  }
}