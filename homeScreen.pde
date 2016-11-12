class homeScreen
{
  color o;
  ArrayList<movingLine> lines = new ArrayList<movingLine>();
  
  float lineX = width+1105;
  float lineY = 0;
  boolean linesLoaded = false;
    
  int d = day();    
  int m = month(); 
  int y = year();
 
  String username;
  
  float curveX = 1060;
  
  void drawHome(String username)
  {
    this.username = username;
    float linexScaleforUsername = (username.length()*30)+55;
    float textScaleforUsername = (username.length()*25);
    
    int i;
    int sec = second(); 
    int min = minute(); 
    int hour = hour();
    
    fill(120, 206, 212);
    textFont(cred);
    textSize(30);
    
    String s = String.valueOf(d);
    text(s+" / ", 85, 125);
    s = String.valueOf(m);
    text(s+" / ", 125, 125); 
    s = String.valueOf(y);
    text(s, 160, 125);
    
    textFont(cred);
    textSize(100);
  
    if (hour < 10)
    {
      String h = String.valueOf(hour);
      text("0"+h+":", 25, 85);
    }
    else if (hour >= 10)
    {
      String h2 = String.valueOf(hour);
      text(h2+":", 25, 85);
    }
    
    if (min < 10)
    {  
      String mS1 = String.valueOf(min);
      text("0"+mS1+":", 120, 85); 
    }
    else if (min >= 10)
    {
      String mS2 = String.valueOf(min);
      text(mS2+":", 120, 85);
    }
     
    if (sec < 10)
    {
      s = String.valueOf(sec);
      text("0"+s, 210, 85);
    }
    else if (sec >= 10)
    {
      s = String.valueOf(sec);
      text(s, 215, 85);
    }
      
    stroke(53, 186, 210);
    strokeWeight(5);
    strokeCap(SQUARE);
    
    line(width-50, 0, width-50, height);
    
    loadLines();
    
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
    
    textFont(cred);
    textSize(70);
    text(username, curveX-textScaleforUsername, 57);
  }
  
  void loadLines()
  {
    int i;
    
    if (linesLoaded == false)
    {
      for (i = 0; i < 60; i++)
      {
        movingLine e = new movingLine();
            
        lineY += 30;
        
        e.setY(lineY);
        e.setX(lineX);
        lines.add(e);
      }
      linesLoaded = true;
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
}