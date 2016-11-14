class createUser
{
  float scaleFactor = 1.1;
  
  float UserBoxX = 615;
  float UserBoxY = 400;
  float UserBoxWidth = 350;
  float UserBoxHeight = 65;
  float UserScaleAmountX = UserBoxX-(UserBoxX/scaleFactor);
  float UserScaleAmountY = UserBoxY-(UserBoxY/scaleFactor);
  
  float PassBoxX = 615;
  float PassBoxY = 500;
  float PassBoxWidth = 350;
  float PassBoxHeight = 65;
  float PassScaleAmountX = PassBoxX-(PassBoxX/scaleFactor);
  float PassScaleAmountY = PassBoxY-(PassBoxY/scaleFactor);
  
  char[] NewUserArray;
  char[] NewPassArray;
  
  boolean TabToBox = false;
  
  //ascii of CAPS LOCK, will be checked by keyCode
  final int CAPS_LOCK = 20;
  
  void registerScreen()
  {
      fill(255, 140, 0);
      textFont(overwatch);
      textSize(50);
      text("Register New User", 475, 300);
      
      fill(255, 140, 0);
      textFont(overwatch);
      textSize(45);
      text("USERNAME :", 240, 412.5);
      text("PASSWORD :", 240, 515);

      strokeWeight(3);
      stroke(255, 140, 0);
      rectMode(CENTER);
      
      printLoginBox(); 
      printPassBox();
  }
  
  void displayUsername()
  {
    for (int i = 0; i < NewUserLogin.size(); i++)
    {
      Creds NewUsername =  NewUserLogin.get(i);
      char letter = NewUsername.c;
      float textX = NewUsername.x;
        
      fill(255, 140, 0);
      textFont(cred);
   
      if (UserLoginClickedC == true || ((mouseX > UserBoxX-(UserBoxWidth/2) && mouseX < UserBoxX+(UserBoxWidth/2)) && (mouseY > UserBoxY-(UserBoxHeight/2) && mouseY < UserBoxY+(UserBoxHeight/2))))
      {
        textSize(50);
        text(letter, textX, 417.5);
      }
      else
      {
        textSize(30);
        text(letter, textX+15, 409.5);
      }
    }
  }
  
  void printLoginBox()
  {
    if (((mouseX > UserBoxX-(UserBoxWidth/2) && mouseX < UserBoxX+(UserBoxWidth/2)) && (mouseY > UserBoxY-(UserBoxHeight/2) && mouseY < UserBoxY+(UserBoxHeight/2))) && UserLoginClickedC == false)
    {
      if (UserLoginClickedC == false)
      {
        fill(255);
          
        pushMatrix();
        scale(scaleFactor);
        rect(UserBoxX-UserScaleAmountX, UserBoxY-UserScaleAmountY, UserBoxWidth, UserBoxHeight);
        popMatrix();
         
        if (mousePressed == true && UserLoginClickedC == false)
        {
          UserLoginClickedC = true;
          delay(100);
        }
      }
        
      displayUsername();
    }
    else
    {
      if (UserLoginClickedC == true)
      {
        fill(200);
          
        pushMatrix();
        scale(scaleFactor);
        rect(UserBoxX-UserScaleAmountX, UserBoxY-UserScaleAmountY, UserBoxWidth, UserBoxHeight);
        popMatrix();
          
        if (keyPressed)
        {
          if (NewUserLogin.size() < 12)
          {
            Creds e = new Creds();
              
            if (key == ' ' || key == ENTER || key == DELETE || keyCode == UP || keyCode == LEFT || keyCode == RIGHT || keyCode == CAPS_LOCK);
  
            else if (key == BACKSPACE && (NewUserLogin.size() != 0))
            {
              NewUserLogin.remove(NewUserLogin.get(NewUserLogin.size()-1));
              LoginCurX -= 25;
              delay(100);
            }
            
            else if (key == BACKSPACE && (NewUserLogin.size() == 0));
            
            else if (key == TAB || keyCode == DOWN)
            {
              UserLoginClickedC = false;
              delay(100);
              UserPassClickedC = true;
              
              //credit to Mohamad for helping me with this bug :)
              //This prevents the Tab key being passed in twice by giving key a random value not accepted by the error checking
              key = DELETE;
            }

            else
            {
              e.c = key;
              e.x = LoginCurX+25;
                
              LoginCurX += 25;
  
              NewUserLogin.add(e);
              delay(100);
            }
          }
          
          fullLoginCheck();
        }
            
        if (mousePressed == true)
        {
          UserLoginClickedC = false;
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
    for (int i = 0; i < NewUserPass.size(); i++)
      {
        Creds NewPassword =  NewUserPass.get(i);
        
        char letter = NewPassword.c;
        float textX = NewPassword.x;
        
        fill(255, 140, 0);
        textFont(cred);
        
        if (UserPassClickedC == true || (mouseX > PassBoxX-(PassBoxWidth/2) && mouseX < PassBoxX+(PassBoxWidth/2)) && (mouseY > PassBoxY-(PassBoxHeight/2) && mouseY < PassBoxY+(PassBoxHeight/2)))
        {
          textSize(50);
          text(letter, textX, 517.5);
        }
        else
        {
          textSize(30);
          text(letter, textX+15, 509.5);
        }
      }
  }
  
  void printPassBox()
  {
    fill(255);
    if ((mouseX > PassBoxX-(PassBoxWidth/2) && mouseX < PassBoxX+(PassBoxWidth/2)) && (mouseY > PassBoxY-(PassBoxHeight/2) && mouseY < PassBoxY+(PassBoxHeight/2)) && UserPassClickedC == false)
    {
      fill(255);
        
      pushMatrix();
      scale(scaleFactor);
      rect(PassBoxX-PassScaleAmountX, PassBoxY-PassScaleAmountY, PassBoxWidth, PassBoxHeight);
      popMatrix();
      
      if (mousePressed == true && UserPassClickedC == false)
      {
        UserPassClickedC = true;
        delay(100);
      }
      
      displayPassword();
    }
    else
    {
      if (UserPassClickedC == true)
      {
        fill(200);
          
        pushMatrix();
        scale(scaleFactor);
        rect(PassBoxX-PassScaleAmountX, PassBoxY-PassScaleAmountY, PassBoxWidth, PassBoxHeight);
        popMatrix();
          
        if (keyPressed)
        {
          if (NewUserPass.size() < 12)
          {
            Creds p = new Creds();
              
            if (key == ' ' || key == ENTER || key == DELETE || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT || keyCode == CAPS_LOCK);
            
            else if (key == BACKSPACE && (NewUserPass.size() != 0))
            {
              NewUserPass.remove(NewUserPass.get(NewUserPass.size()-1));
              PassCurX -= 25;
              delay(100);
            }
            
            else if (key == BACKSPACE && (NewUserPass.size() == 0));
            
            else if (key == TAB || keyCode == UP)
            {
              UserPassClickedC = false;
              delay(100);
              UserLoginClickedC = true;
              
              key = DELETE;
            }
 
            else
            {
              p.c = key;
              p.x = PassCurX+25;
                
              PassCurX += 25;
  
              NewUserPass.add(p);
              delay(100);
            }
          }
           
          fullPassCheck();
        }
            
        if (mousePressed == true)
        {
          UserPassClickedC = false;
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
  
  void fullPassCheck()
  {
    if (NewUserPass.size() == 12)
    {
      if (key == BACKSPACE && (NewUserPass.size() != 0))
      {
        NewUserPass.remove(NewUserPass.get(NewUserPass.size()-1));
        PassCurX -= 25;
        delay(100);
      }
            
      else if ((key == TAB || keyCode == UP) && (NewUserPass.size() != 0))
      {
        UserPassClickedC = false;
        delay(100);
        UserLoginClickedC = true;
        
        key = DELETE;
      }
    }
  }
  
  void fullLoginCheck()
  {
    if (NewUserLogin.size() == 12)
    {
      if (key == BACKSPACE && (NewUserLogin.size() != 0))
      {
        NewUserLogin.remove(NewUserLogin.get(NewUserLogin.size()-1));
        LoginCurX -= 25;
        delay(100);
      }
            
      else if ((key == TAB || keyCode == DOWN) && (NewUserLogin.size() != 0))
      {
        UserLoginClickedC = false;
        delay(100);
        UserPassClickedC = true;
        
        key = DELETE;
      }
    }
  }
}