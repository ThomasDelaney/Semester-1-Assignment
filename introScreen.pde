class introScreen
{ 
  color o;
  int inc = 0;
  
  float scaleFactor = 1.1;
  
  float UserBoxX = 615;
  float UserBoxY = 575;
  float UserBoxWidth = 350;
  float UserBoxHeight = 65;
  float UserScaleAmountX = UserBoxX-(UserBoxX/scaleFactor);
  float UserScaleAmountY = UserBoxY-(UserBoxY/scaleFactor);
  
  float PassBoxX = 615;
  float PassBoxY = 660;
  float PassBoxWidth = 350;
  float PassBoxHeight = 65;
  float PassScaleAmountX = PassBoxX-(PassBoxX/scaleFactor);
  float PassScaleAmountY = PassBoxY-(PassBoxY/scaleFactor);
  
  ArrayList<Creds> UserLogin = new ArrayList<Creds>();
  
  boolean UserLoginClicked = false;
  boolean UserPasswordClicked = false;
  
  float LoginCurX = 413;
  
  void loadLogin()
  {
    o = color(255, 140, 0, inc);
    athena1.drawAthenaLogo(o);  
    
    if (timer < 8)
    {
      inc += 3;
      
      if (inc >= 255)
      {
        inc = 0;
      }
      
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
    else
    {
      textFont(overwatch);
      textSize(45);
      text("USERNAME :", 240, 590);
      text("PASSWORD :", 240, 675);
      
      strokeWeight(3);
      stroke(255, 140, 0);
      rectMode(CENTER);
      
      if (((mouseX > UserBoxX-(UserBoxWidth/2) && mouseX < UserBoxX+(UserBoxWidth/2)) && (mouseY > UserBoxY-(UserBoxHeight/2) && mouseY < UserBoxY+(UserBoxHeight/2))) && UserLoginClicked == false)
      {
        if (UserLoginClicked == false)
        {
          fill(255);
          
          pushMatrix();
          scale(scaleFactor);
          rect(UserBoxX-UserScaleAmountX, UserBoxY-UserScaleAmountY, UserBoxWidth, UserBoxHeight);
          popMatrix();
         
          if (mousePressed == true && UserLoginClicked == false)
          {
            UserLoginClicked = true;
            delay(100);
          }
        }
      }
      else
      {
        if (UserLoginClicked == true)
        {
          fill(200);
          
          pushMatrix();
          scale(scaleFactor);
          rect(UserBoxX-UserScaleAmountX, UserBoxY-UserScaleAmountY, UserBoxWidth, UserBoxHeight);
          popMatrix();
          
          if (keyPressed)
          {
            if (UserLogin.size() < 12)
            {
              Creds e = new Creds();
              
              if (key == ' ')
              {
                println("You cannot have this character "+ key + " in your Username");
              }
              else
              {
                e.c = key;
                e.x = LoginCurX+25;
                
                LoginCurX += 25;
  
                UserLogin.add(e);
                delay(100);
              }
            }
          }
            
          if (mousePressed == true)
          {
            UserLoginClicked = false;
            delay(100);
          }
        }
        else
        {
          fill(255);
          rect(UserBoxX, UserBoxY, UserBoxWidth, UserBoxHeight);
        }
      }
      
      for (int i = 0; i < UserLogin.size(); i++)
      {
        Creds Username =  UserLogin.get(i);
        char letter = Username.c;
        float textX = Username.x;
        
        fill(255, 140, 0);
        textFont(cred);
        textSize(50);
        text(letter, textX, 593);
      }
      
      fill(255);
      if ((mouseX > PassBoxX-(PassBoxWidth/2) && mouseX < PassBoxX+(PassBoxWidth/2)) && (mouseY > PassBoxY-(PassBoxHeight/2) && mouseY < PassBoxY+(PassBoxHeight/2)))
      {
        fill(255);
        
        pushMatrix();
        scale(scaleFactor);
        rect(PassBoxX-PassScaleAmountX, PassBoxY-PassScaleAmountY, PassBoxWidth, PassBoxHeight);
        popMatrix();
      }
      else
      {
        rect(PassBoxX, PassBoxY, PassBoxWidth, PassBoxHeight);
      }
    }
  }
}