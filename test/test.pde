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
String username = "a";

float linexScaleforUsername = (username.length()*30)+55;
float textScaleforUsername = (username.length()*25);

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
  
  float curveX = 1060;
  
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
  else
  {
    String h2 = String.valueOf(hour);
    text(h2+":", 25, 85);
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
    String sS1 = String.valueOf(sec);
    text(sS1, 210, 85);
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
  
  textSize(70);
  text("a", width/2, height/2);
  line(width/2+2, height/2+5, width/2+24, height/2+5);
}