class heroDatabase
{
  Logo OW;
  
  float scaleFactor = 1.1;
  
  float ReturnBoxX = 1100;
  float ReturnBoxY = 660;
  float ReturnBoxWidth = 150;
  float ReturnBoxHeight = 65;
  float ReturnScaleAmountX = ReturnBoxX-(ReturnBoxX/scaleFactor);
  float ReturnScaleAmountY = ReturnBoxY-(ReturnBoxY/scaleFactor);
  
  void displayDB()
  {
    OW = new Logo(1092.5, 400, 275, false);
    OW.drawOverwatchLogo(255);
    
    strokeWeight(3);
    stroke(255, 140, 0);
    rectMode(CENTER);
    printReturnBox();
    
    printDB();
  }
  
  void printDB()
  {
    for(int i = 0; i < heroBoxes.size(); i++)
    {
      heroBox h = heroBoxes.get(i);
      h.checkBox();
    }
  }
  
  void loadDB()
  {
    GenBoxX = 170;
    GenBoxY = 60;
  
    for(int i = 0; i < heroes.size(); i++)
    {
      Hero e = heroes.get(i) ;
   
      heroBox h = new heroBox(e);
      
      h.BoxX = GenBoxX;
      h.BoxY = GenBoxY;
      
      if (GenBoxY+100 > height)
      {
        GenBoxY = 60;
        GenBoxX += 300;
      }
      else
      {
        GenBoxY += 100;
      }
      
      heroBoxes.add(h);
    }
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
        state = 1;
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