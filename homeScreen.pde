class homeScreen
{
  int i;
  color o;
  ArrayList <movingLine> lines = new ArrayList<movingLine>();
  Logo besideUsername;
  
  float lineX = width+1105;
  float lineY = 0;
    
  int d = day();    
  int m = month(); 
  int y = year();
 
  String username;
  
  float curveX = 1060;
  
  float scaleFactor = 1.1;

  float LogoutBoxX = 107;
  float LogoutBoxY = 657.5;
  float LogoutBoxWidth = 150;
  float LogoutBoxHeight = 65;
  float LogoutScaleAmountX = LogoutBoxX-(LogoutBoxX/scaleFactor);
  float LogoutScaleAmountY = LogoutBoxY-(LogoutBoxY/scaleFactor);
  
  float HeroBoxX = 445;
  float HeroBoxY = 47;
  float HeroBoxWidth = 280;
  float HeroBoxHeight = 65;
  float HeroScaleAmountX = HeroBoxX-(HeroBoxX/scaleFactor);
  float HeroScaleAmountY = HeroBoxY-(HeroBoxY/scaleFactor);
  
  float homeMapX = 12.5;
  float homeMapY = 135;
  float homeMapWidth = 1025;
  float homeMapHeight = 570;
  
  String curHeroName;
  float curHeroX;
  float curHeroY;
  
  float theta = 2;
  float lastAngle = 0;
  
  void drawHome(String username)
  {
    this.username = username;
    float linexScaleforUsername = (username.length()*30)+55;
    float textScaleforUsername = (username.length()*25);
    
    int i;
    
    fill(120, 206, 212);
    textFont(cred);
    textSize(30);
    
    String s = String.valueOf(d);
    text(s+" / ", 75, 125);
    s = String.valueOf(m);
    text(s+" / ", 115, 125); 
    s = String.valueOf(y);
    text(s, 150, 125);
    
    textFont(cred);
    textSize(100);
    clock();
      
    stroke(53, 186, 210);
    strokeWeight(5);
    strokeCap(SQUARE);
    
    line(width-50, 0, width-50, height);
    
    for (i = 0; i < 60; i++)
    {
      movingLine e = lines.get(i);
      e.drawLine();
    }
    
    stroke(120, 206, 212);
    strokeWeight(5);
    strokeCap(SQUARE);
    line(width-150, 100, width-150, height-200);
    
    noFill();
    bezier(1130, 518, 1130, 536.2, 1130, 556.4, 1071.7, 560.4);
    bezier(1130, 150, 1132.5, 76.3, 1132.5, 65.6, 1060, 68);
    line(curveX+1, 68, curveX-linexScaleforUsername, 68);
    bezier(curveX-linexScaleforUsername, 68, (curveX-linexScaleforUsername)-16, 68, (curveX-linexScaleforUsername)-24, 60, (curveX-linexScaleforUsername)-23, 41.5);
    line((curveX-linexScaleforUsername)-23, 42, (curveX-linexScaleforUsername)-23, 0);
    
    besideUsername = new Logo((curveX-textScaleforUsername)-40-(username.length()*2), 32.5, 50, false);
    besideUsername.drawOverwatchLogo(255);
    
    fill(255);
    textFont(cred);
    textSize(70);
    text(username, curveX-textScaleforUsername, 57);
    
    strokeWeight(3);
    stroke(255, 140, 0);
    rectMode(CENTER);
    printLogOutBox();
    
    rectMode(CORNER);
    stroke(255);
    noFill();
    rect(homeMapX, homeMapY, homeMapWidth, homeMapHeight);
    image(worldHome, homeMapX-10, homeMapY+20);
    
    noStroke();
    printHeroLocations();
    
    strokeWeight(3);
    stroke(255, 140, 0);
    rectMode(CENTER);
    printHeroBox();
    
    lastAngle += theta/20;
    
    if (lastAngle >= 2*PI)
    {
      lastAngle = 0;
    }
  }
  
  void printHeroBox()
  {
    if (((mouseX > HeroBoxX-(HeroBoxWidth/2) && mouseX < HeroBoxX+(HeroBoxWidth/2)) && (mouseY > HeroBoxY-(HeroBoxHeight/2) && mouseY < HeroBoxY+(HeroBoxHeight/2))))
    {
      fill(255);
          
      pushMatrix();
      scale(scaleFactor);
      rect(HeroBoxX-HeroScaleAmountX, HeroBoxY-HeroScaleAmountY, HeroBoxWidth, HeroBoxHeight);
      popMatrix();
        
      fill(255, 140, 0);
      textFont(cred);
        
      textSize(60);
      text("Hero Database", HeroBoxX-135, HeroBoxY+20);
      
      if (mousePressed == true)
      {
        delay(100);
        state = 3;
      }
    }
    else
    {
      fill(255);
      rect(HeroBoxX, HeroBoxY, HeroBoxWidth, HeroBoxHeight);
      
      fill(255, 140, 0);
      textFont(cred);
      textSize(50);
      text("Hero Database", HeroBoxX-115, HeroBoxY+20);
    }
  }
  
  void loadLines()
  {
    int i;
    for (i = 0; i < 60; i++)
    {
      movingLine e = new movingLine();
            
      lineY += 30;
        
      e.y = lineY;
      e.x = lineX;
      lines.add(e);
    }
  }
  
  void loadHeroes()
  {
    Table HeroTable = loadTable("heroes.txt", "tsv");
  
    int rowCount = HeroTable.getRowCount();
  
    for(int i = 0; i < rowCount; i++)
    {
      Hero e = new Hero(HeroTable.getString(i,0), HeroTable.getString(i,1), HeroTable.getFloat(i,2), HeroTable.getFloat(i,3), HeroTable.getString(i,4), HeroTable.getString(i,5), HeroTable.getString(i,6), i);
      e.mapGPS(homeMapX, homeMapY, homeMapWidth, homeMapHeight);
      heroes.add(e);
    }
  }
  
  void printHeroLocations()
  {
    for (int i = 0; i < heroes.size(); i++)
    {
      Hero e = heroes.get(i);
      if (dist(mouseX, mouseY, e.x, e.y) < 12 / 2)
      {
        noStroke();
        fill(255, 255, 0);
        ellipse(e.x, e.y, 12, 12);

        
        if (mousePressed)
        {
          heroSelect = true;
          curHeroName = e.name;
          curHeroX = e.x+10;
          curHeroY = e.y+6.5;
          e.greeting.play();
          delay(50);
          mV = false;
        }
        else
        {
          mV = true;
        }
      }
      else
      {
        if (heroSelect == true)
        {
           if (mousePressed && mV == true)
           {
             heroSelect = false;
           }
           
          noStroke(); 
          fill(255);
          textSize(20);
          text(curHeroName, curHeroX, curHeroY);
      
          
          fill(255, 255, 0);
          ellipse(curHeroX-10, curHeroY-6.5, 12, 12);
          
          fill(255, 0, 0);
          ellipse(e.x, e.y, 8, 8);
          
          noFill();
          strokeCap(SQUARE);
          strokeWeight(4);
          stroke(255, 0, 0);
          arc(e.x, e.y, 16, 16, lastAngle,lastAngle+theta);
          noStroke();
        }
        else
        {
          noStroke();
          fill(255, 0, 0);
          ellipse(e.x, e.y, 8, 8);
          noFill();
          strokeCap(SQUARE);
          strokeWeight(4);
          stroke(255, 0, 0);
          arc(e.x, e.y, 16, 16, lastAngle,lastAngle+theta);
          noStroke();
        }
      }
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
  
void printLogOutBox()
{
  if (((mouseX > LogoutBoxX-(LogoutBoxWidth/2) && mouseX < LogoutBoxX+(LogoutBoxWidth/2)) && (mouseY > LogoutBoxY-(LogoutBoxHeight/2) && mouseY < LogoutBoxY+(LogoutBoxHeight/2))))
  {
    fill(255);
          
    pushMatrix();
    scale(scaleFactor);
    rect(LogoutBoxX-LogoutScaleAmountX, LogoutBoxY-LogoutScaleAmountY, LogoutBoxWidth, LogoutBoxHeight);
    popMatrix();
        
    fill(255, 140, 0);
    textFont(cred);
        
    textSize(60);
    text("Log Out", LogoutBoxX-70, LogoutBoxY+20);
      
    if (mousePressed == true)
    {
      key = DELETE;
      username = "";
      password = "";
      
      UserLogin.clear();

      UserPass.clear();
      
      LoginCurX = 413;
      PassCurX = 413;
      
      state = 0;
    }
  }
  else
  {
    fill(255);
    rect(LogoutBoxX, LogoutBoxY, LogoutBoxWidth, LogoutBoxHeight);
    
    fill(255, 140, 0);
    textFont(cred);
    textSize(50);
    text("Log Out", LogoutBoxX-60, LogoutBoxY+20);
  }
}

  
  void clock()
  {
    int sec = second(); 
    int min = minute(); 
    int hour = hour();
    
    if (hour < 10)
    {
      String h = String.valueOf(hour);
      text("0"+h+":", 15, 85);
    }
    else if (hour >= 10)
    {
      String h2 = String.valueOf(hour);
      text(h2+":", 15, 85);
    }
    
    if (min < 10)
    {  
      String mS1 = String.valueOf(min);
      text("0"+mS1+":", 110, 85); 
    }
    else if (min >= 10)
    {
      String mS2 = String.valueOf(min);
      text(mS2+":", 110, 85);
    }
     
    if (sec < 10)
    {
      String s = String.valueOf(sec);
      text("0"+s, 205, 85);
    }
    else if (sec >= 10)
    {
      String s = String.valueOf(sec);
      text(s, 205, 85);
    }
  }
}