class heroBox
{
  Hero h;
  
  float scaleFactor = 1.1;
    
  float BoxX;
  float BoxY;
  float BoxWidth = 275;
  float BoxHeight = 65;
  float BoxScaleAmountX;
  float BoxScaleAmountY;
  
  heroBox(Hero h)
  {
    this.h = h;
    
    this.BoxX = GenBoxX;
    this.BoxY = GenBoxY;
    this.BoxScaleAmountX = BoxX-(BoxX/scaleFactor);
    this.BoxScaleAmountY = BoxY-(BoxY/scaleFactor);
  }
  
  void checkBox()
  {
    strokeWeight(3);
    stroke(255, 140, 0);
    rectMode(CENTER);
    if (((mouseX > BoxX-(BoxWidth/2) && mouseX < BoxX+(BoxWidth/2)) && (mouseY > BoxY-(BoxHeight/2) && mouseY < BoxY+(BoxHeight/2))))
    {
      fill(255);
          
      pushMatrix();
      scale(scaleFactor);
      rect(BoxX-BoxScaleAmountX, BoxY-BoxScaleAmountY, BoxWidth, BoxHeight);
      popMatrix();
        
      fill(255, 140, 0);
      textFont(cred);
        
      textSize(60);
      text(h.name, BoxX-135, BoxY+20);
      
      if (mousePressed == true)
      {
        delay(100);
      }
    }
    else
    {
      fill(255);
      rect(BoxX, BoxY, BoxWidth, BoxHeight);
      
      fill(255, 140, 0);
      textFont(cred);
      textSize(50);
      text(h.name, BoxX-115, BoxY+20);
    }
  }
}