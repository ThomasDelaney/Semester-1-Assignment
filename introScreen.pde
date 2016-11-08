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
  ArrayList<Creds> UserPass = new ArrayList<Creds>();
  
  boolean UserLoginClicked = false;
  boolean UserPassClicked = false;
  
  float LoginCurX = 413;
  float PassCurX = 413;
  
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
      
      printLoginBox();
      printPassBox();
    }
  }
  
  void displayUsername()
  {
    for (int i = 0; i < UserLogin.size(); i++)
      {
        Creds Username =  UserLogin.get(i);
        char letter = Username.c;
        float textX = Username.x;
        
        fill(255, 140, 0);
        textFont(cred);
        
        if (UserLoginClicked == true || ((mouseX > UserBoxX-(UserBoxWidth/2) && mouseX < UserBoxX+(UserBoxWidth/2)) && (mouseY > UserBoxY-(UserBoxHeight/2) && mouseY < UserBoxY+(UserBoxHeight/2))))
        {
          textSize(50);
          text(letter, textX, 593);
        }
        else
        {
          textSize(30);
          text(letter, textX+15, 585);
        }
      }
  }
  
  void printLoginBox()
  {
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
        
      displayUsername();
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
            else if (key == BACKSPACE && (UserLogin.size() != 0))
            {
              UserLogin.remove(UserLogin.get(UserLogin.size()-1));
              LoginCurX -= 25;
              delay(100);
            }
            else if (key == BACKSPACE && (UserLogin.size() == 0))
            {
              println("Can't press backspace when array is empty");
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
        
      displayUsername();
    }
  }
    
  
  void displayPassword()
  {
    for (int i = 0; i < UserPass.size(); i++)
      {
        Creds Password =  UserPass.get(i);
  
        float textX = Password.x;
        
        fill(255, 140, 0);
        textFont(cred);
        
        if (UserPassClicked == true || (mouseX > PassBoxX-(PassBoxWidth/2) && mouseX < PassBoxX+(PassBoxWidth/2)) && (mouseY > PassBoxY-(PassBoxHeight/2) && mouseY < PassBoxY+(PassBoxHeight/2)))
        {
          textSize(50);
          text(".", textX, 665);
        }
        else
        {
          textSize(30);
          text(".", textX+15, 665);
        }
      }
  }
  
  void printPassBox()
  {
    fill(255);
    if ((mouseX > PassBoxX-(PassBoxWidth/2) && mouseX < PassBoxX+(PassBoxWidth/2)) && (mouseY > PassBoxY-(PassBoxHeight/2) && mouseY < PassBoxY+(PassBoxHeight/2)) && UserPassClicked == false)
    {
      fill(255);
        
      pushMatrix();
      scale(scaleFactor);
      rect(PassBoxX-PassScaleAmountX, PassBoxY-PassScaleAmountY, PassBoxWidth, PassBoxHeight);
      popMatrix();
      
      if (mousePressed == true && UserPassClicked == false)
      {
        UserPassClicked = true;
        delay(100);
      }
      
      displayPassword();
    }
    else
    {
      if (UserPassClicked == true)
      {
        fill(200);
          
        pushMatrix();
        scale(scaleFactor);
        rect(PassBoxX-PassScaleAmountX, PassBoxY-PassScaleAmountY, PassBoxWidth, PassBoxHeight);
        popMatrix();
          
        if (keyPressed)
        {
          if (UserPass.size() < 12)
          {
            Creds p = new Creds();
              
            if (key == ' ')
            {
              println("You cannot have this character "+ key + " in your Password");
            }
            else if (key == BACKSPACE && (UserPass.size() != 0))
            {
              UserPass.remove(UserPass.get(UserPass.size()-1));
              PassCurX -= 25;
              delay(100);
            }
            else if (key == BACKSPACE && (UserPass.size() == 0))
            {
              println("Can't press backspace when array is empty");
            }
            else
            {
              p.c = key;
              p.x = PassCurX+25;
                
              PassCurX += 25;
  
              UserPass.add(p);
              delay(100);
            }
          }
        }
            
        if (mousePressed == true)
        {
          UserPassClicked = false;
          delay(100);
        }
      }
      else
      {
        fill(255);
        rect(PassBoxX, PassBoxY, PassBoxWidth, PassBoxHeight);
      }
        
      displayPassword();
    }
  }
}