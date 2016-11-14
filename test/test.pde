void setup()
{
  size(1280,720);
  frameRate(60);
  
  bg = loadImage("background.jpg");
  overwatch = createFont("bignoodletoo.ttf", 150); 
  cred = createFont("koverwatch.ttf", 150); 
  textFont(overwatch);
}

PFont overwatch;
PFont cred;
PImage bg;
String username = "WNSTN";

float linexScaleforUsername = (username.length()*30)+55;
float textScaleforUsername = (username.length()*25);

float curveX = 1060;

void draw()
{
  image(bg, 0, 0);
  
  fill(120, 206, 212);
  textFont(cred);
  textSize(30);
  
  int d = day();    
  int m = month(); 
  int y = year(); 

  int sec = second(); 
  int min = minute(); 
  int hour = hour();
  
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
    text("0"+h+":", 30, 85);
  }
  else
  {
    String h2 = String.valueOf(hour);
    text(h2+":", 30, 85);
  }
  
  
  if (min < 10)
  {  
    String mS1 = String.valueOf(min);
    text("0"+mS1+":", 120, 85); 
  }
  else
  {
    String mS2 = String.valueOf(min);
    text(mS2+":", 120, 85);
  }
   
  if (sec < 10)
  {
    String sS1 = String.valueOf(sec);
    text("0"+sS1, 210, 85);
  }
  else if (sec >= 10)
  {
    String sS2 = String.valueOf(sec);
    text(sS2, 210, 85);
  }
  
  
  
  stroke(120, 206, 212);
  strokeWeight(5);
  strokeCap(SQUARE);
  line(width-150, 100, width-150, height-200);
    
  noFill();
  bezier(1130, 518, 1130, 536.2, 1130, 556.4, 1071.7, 560.4);
  bezier(1130, 150, 1132.5, 76.3, 1132.5, 65.6, 1060, 68);
  line(curveX+1, 68, (curveX-linexScaleforUsername)-1, 68);
  bezier(curveX-linexScaleforUsername, 68, (curveX-linexScaleforUsername)-16, 68, (curveX-linexScaleforUsername)-24, 60, (curveX-linexScaleforUsername)-23, 41.5);
  line((curveX-linexScaleforUsername)-23, 42, (curveX-linexScaleforUsername)-23, 0);
  
  textFont(cred);
  textSize(70);
  text(username, curveX-textScaleforUsername, 57);
  drawOverwatchLogo();
  
  strokeWeight(3);
  stroke(255, 140, 0);
  rectMode(CENTER);
  printLogOutBox();
  
  
  
  textSize(70);
  text("a", width/2, height/2);
  line(width/2+2, height/2+5, width/2+24, height/2+5);
}

float size = 50;
color c = 255;
float x = (curveX-textScaleforUsername)-40-(username.length()*2);
float y = 32.5;
float logoThicknessConst = 7.69230769231;

void drawOverwatchLogo()
{
  noFill();
  stroke(c);
  strokeWeight(size/logoThicknessConst);
  strokeCap(SQUARE);
  arc(x, y, size, size, -QUARTER_PI, PI+QUARTER_PI);
  stroke(255, 165, 0);
  arc(x, y, size, size, PI+QUARTER_PI+(QUARTER_PI/8), PI+HALF_PI+QUARTER_PI-(QUARTER_PI/8));
   
  fill(c);
  noStroke();
    
  beginShape();
    
  vertex(x-convertSize(7), y+convertSize(25));
  vertex(x-convertSize(85), y+convertSize(105));
  vertex(x-convertSize(110), y+convertSize(80));
  vertex(x-convertSize(40), y+convertSize(15));
  vertex(x-convertSize(8), y-convertSize(85));
  vertex(x-convertSize(7), y+convertSize(25));
    
  endShape(CLOSE);
    
  beginShape();
    
  vertex(x+convertSize(7), y+convertSize(25));
  vertex(x+convertSize(85), y+convertSize(105));
  vertex(x+convertSize(110), y+convertSize(80));
  vertex(x+convertSize(40), y+convertSize(15));
  vertex(x+convertSize(8), y-convertSize(85));
  vertex(x+convertSize(7), y+convertSize(25));

  endShape(CLOSE);
}

float scaleFactor = 1.1;

float LogoutBoxX = 97.5;
float LogoutBoxY = 670;
float LogoutBoxWidth = 150;
float LogoutBoxHeight = 65;
float LogoutScaleAmountX = LogoutBoxX-(LogoutBoxX/scaleFactor);
float LogoutScaleAmountY = LogoutBoxY-(LogoutBoxY/scaleFactor);

boolean LogoutClicked = false;

void printLogOutBox()
{
    if (((mouseX > LogoutBoxX-(LogoutBoxWidth/2) && mouseX < LogoutBoxX+(LogoutBoxWidth/2)) && (mouseY > LogoutBoxY-(LogoutBoxWidth/2) && mouseY < LogoutBoxY+(LogoutBoxWidth/2))))
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
        LogoutClicked = true;
        delay(100);
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

float convertSize(float constant)
{
  float num = 300/constant;
  constant = size /num; 
  return constant;
}