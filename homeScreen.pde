class homeScreen
{
  color o;
  ArrayList<movingLine> lines = new ArrayList<movingLine>();
  
  float lineX = width+1105;
  float lineY = 0;
  boolean linesLoaded = false;
  
  //boolean homeLoaded = false;
  
  void drawHome()
  {
    int i;
    stroke(53, 186, 210);
    strokeWeight(3);
    strokeCap(SQUARE);
    
    line(width-50, 0, width-50, height);
    
    loadLines();
    
    for (i = 0; i < 60; i++)
    {
      movingLine e = lines.get(i);
      e.drawLine();
    }
  }
  
  void loadLines()
  {
    int i;
    
    if (linesLoaded == false)
    {
      for (i = 0; i < 60; i++)
      {
        movingLine e = new movingLine();
            
        lineY += 30;
        
        e.setY(lineY);
        e.setX(lineX);
        lines.add(e);
      }
      linesLoaded = true;
    }
  }
  
  void loadInHome()
  {
    o = color(255, 140, 0);
    athena1.drawAthenaLogo(o);  
   
    fill(255);
    textFont(overwatch);
    textSize(50);
    text("Loading", 550, 600);
      
    if (timer % 3 == 1)
    {
      textSize(50);
      text(".", 550, 630);
    }
    else if (timer % 3 == 2)
    {
      text(".", 550, 630);
      text(".", 605, 630);
    }
     else if (timer % 3 == 0)
    {
      text(".", 550, 630);
      text(".", 605, 630);
      text(".", 660, 630);
    }
  }
}