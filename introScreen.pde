class introScreen
{ 
  color o;
  float x = 615;
  float y = 575;
  int inc = 0;
  
  void loadLogin()
  {
    o = color(255, 140, 0, inc);
    athena1.drawAthenaLogo(o);  
    
    inc += 3;
    
    if (inc >= 255)
    {
      inc = 0;
    }
    
    fill(255);
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