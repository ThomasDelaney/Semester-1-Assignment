class heroPage
{
  float y = 100;
  float x = 100;
  
  void loadPages(Hero h)
  {  
    fill(255, 140, 0);
    textFont(overwatch);
    textSize(45);
      
    text("Name: "+h.name, x, y);
    y += 100;
      
    text("Place of Birth: "+h.birthplace, x, y);
    y += 100;
      
    if (h.member.equals("true"))
    {
      text("Member of Overwarcg: Yes", x, y);
    }
    else
    {
      text("Member of Overwarcg: No", x, y);
    }
      
    y += 100;
    if (h.alive.equals("true"))
    {
      text("Alive: Yes", x, y);
    }
    else
    {
      text("Alive: No", x, y);
    }
      
    y += 100;
    text("Overwatch Base: "+h.base, x, y);
  }
}