class heroPage
{
  float y = 50;
  float x = 25;
  
  float scaleFactor = 1.1;
  
  float ReturnBoxX = 1100;
  float ReturnBoxY = 660;
  float ReturnBoxWidth = 150;
  float ReturnBoxHeight = 65;
  float ReturnScaleAmountX = ReturnBoxX-(ReturnBoxX/scaleFactor);
  float ReturnScaleAmountY = ReturnBoxY-(ReturnBoxY/scaleFactor);
  
  void printPage(int index)
  {  
    y = 50;
    Hero h = heroes.get(index);
    
    fill(255, 140, 0);
    textFont(overwatch);
    textSize(45);
      
    text("Name: "+h.name, x, y);
    y += 100;
      
    text("Place of Birth: "+h.birthplace, x, y);
    y += 100;
      
    if (h.member.equals("true"))
    {
      text("Member of Overwatch: Yes", x, y);
    }
    else
    {
      text("Member of Overwatch: No", x, y);
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
    
    image(h.portrait, 450, 50);
  }
  
  void printReturnBox()
  {
    if (((mouseX > ReturnBoxX-(ReturnBoxWidth/2) && mouseX < ReturnBoxX+(ReturnBoxWidth/2)) && (mouseY > ReturnBoxY-(ReturnBoxHeight/2) && mouseY < ReturnBoxY+(ReturnBoxHeight/2))))
    {
      fill(255);
          
      pushMatrix();
      scale(scaleFactor);
      rect(ReturnBoxX-ReturnScaleAmountX, ReturnBoxY-ReturnScaleAmountY, ReturnBoxWidth, ReturnBoxHeight);
      popMatrix();
        
      fill(255, 140, 0);
      textFont(cred);
        
      textSize(60);
      text("Return", ReturnBoxX-60, ReturnBoxY+20);
      
      if (mousePressed == true)
      {
        state = 3;
        delay(100);
      }
    }
    else
    {
      fill(255);
      rect(ReturnBoxX, ReturnBoxY, ReturnBoxWidth, ReturnBoxHeight);
      
      fill(255, 140, 0);
      textFont(cred);
      textSize(50);
      text("Return", ReturnBoxX-50, ReturnBoxY+20);
    }
  }
}