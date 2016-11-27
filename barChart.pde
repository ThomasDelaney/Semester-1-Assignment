class barChart
{
  float barLineX = 35;
  float barLineY = 700;
  
  String BR;
  String Power;
  String BA;
  String BP;
  
  float barGoal1 = (int)random(1, 700);
  float barWidth1 = (int)random(1, 700);
  
  float barGoal2 = (int)random(1, 700);
  float barWidth2 = (int)random(1, 700);
  
  float barGoal3 = (int)random(1, 700);
  float barWidth3 = (int)random(1, 700);
  
  float barGoal4 = (int)random(1, 700);
  float barWidth4 = (int)random(1, 700);
  
  void drawBars()
  {
    barWidth1 = checkBarWidth(barWidth1, barGoal1);
  
    if (barWidth1 == barGoal1)
    {
      barGoal1 = (int)random(1, 700);
    }
    
    barWidth2 = checkBarWidth(barWidth2, barGoal2);
    if (barWidth2 == barGoal2)
    {
      barGoal2 = (int)random(1, 700);
    }
    
    barWidth3 = checkBarWidth(barWidth3, barGoal3);
    if (barWidth3 == barGoal3)
    {
      barGoal3 = (int)random(1, 700);
    }
    
    
    barWidth4 = checkBarWidth(barWidth4, barGoal4);
    if (barWidth4 == barGoal4)
    {
      barGoal4 = (int)random(1, 700);
    }
    
   
    noStroke();
    rectMode(CORNER);
    
    fill(255, 0, 0);
    rect(barLineX, barLineY-40, barWidth1, 32);
    fill(255);
    text("B.P", barWidth1+45, barLineY-15);
    text(String.valueOf(barWidth1), barWidth1+85, barLineY-15);
 
    
    fill(0, 255, 0);
    rect(barLineX, barLineY-90, barWidth2, 32);
    fill(255);
    text("B.A", barWidth2+45, barLineY-65);
    text(String.valueOf(barWidth2), barWidth2+85, barLineY-65);
    
    fill(0, 0, 255);
    rect(barLineX, barLineY-140, barWidth3, 32);
    fill(255);
    text("B.R", barWidth3+45, barLineY-115);
    text(String.valueOf(barWidth3), barWidth3+85, barLineY-115);
    
    fill(255, 255, 0);
    rect(barLineX, barLineY-190, barWidth4, 32);
    fill(255);
    text("Power", barWidth4+45, barLineY-165);
    text(String.valueOf(barWidth4), barWidth4+110, barLineY-165);
    
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