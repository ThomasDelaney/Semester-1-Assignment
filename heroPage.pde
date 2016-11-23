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
  
  int borderX = 825;
  float borderY = 200;
  
  float lineX = 825;
  float lineY = 200/1.625;
  
  pieChart p1 = new pieChart();
  
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
    
    sineGraph w1 = h.waves.get(0);
    w1.update();
    w1.render();
    
    sineGraph w2 = h.waves.get(1);
    w2.update();
    w2.render();
    
    sineGraph w3 = h.waves.get(2);
    w3.update();
    w3.render();
    
    sineGraph w4 = h.waves.get(3);
    w4.update();
    w4.render();
    
    p1.drawChart();
    h.b.drawBars();
    
    stroke(255);
    strokeWeight(3);
    line(borderX, borderY, borderX+400, borderY);
    line(borderX, borderY, borderX, borderY-150);
    
    fill(255, 0, 0);
    textFont(overwatch);
    textSize(20);
    text("Blood Pressure", borderX, borderY+30);
    
    fill(0, 255, 0);
    text("Breathing Rate", borderX+110, borderY+30);
    
    fill(0, 0, 255);
    text("Brain Activity", borderX+220, borderY+30);
    
    fill(255, 255, 0);
    text("Power", borderX+330, borderY+30);
    
  }
  
  void printReturnBox()
  {
    if (((mouseX > ReturnBoxX-(ReturnBoxWidth/2) && mouseX < ReturnBoxX+(ReturnBoxWidth/2)) && (mouseY > ReturnBoxY-(ReturnBoxHeight/2) && mouseY < ReturnBoxY+(ReturnBoxHeight/2))))
    {
      fill(255);
          
      pushMatrix();
      scale(scaleFactor);
      rectMode(CENTER);
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
      rectMode(CENTER);
      rect(ReturnBoxX, ReturnBoxY, ReturnBoxWidth, ReturnBoxHeight);
      
      fill(255, 140, 0);
      textFont(cred);
      textSize(50);
      text("Return", ReturnBoxX-50, ReturnBoxY+20);
    }
  }
}