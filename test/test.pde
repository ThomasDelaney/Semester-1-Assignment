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
  
  strokeWeight(3);
  stroke(255, 140, 0);
  rectMode(CENTER);
  printLogOutBox();
  printHeroBox();
}

float scaleFactor = 1.1;

float LogoutBoxX = 400;
float LogoutBoxY = 50;
float LogoutBoxWidth = 150;
float LogoutBoxHeight = 65;
float LogoutScaleAmountX = LogoutBoxX-(LogoutBoxX/scaleFactor);
float LogoutScaleAmountY = LogoutBoxY-(LogoutBoxY/scaleFactor);


float HeroBoxX = 650;
float HeroBoxY = 50;
float HeroBoxWidth = 300;
float HeroBoxHeight = 65;
float HeroScaleAmountX = HeroBoxX-(HeroBoxX/scaleFactor);
float HeroScaleAmountY = HeroBoxY-(HeroBoxY/scaleFactor);

boolean LogoutClicked = false;
boolean HeroBoxClicked = false;

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

void printHeroBox()
{
    if (((mouseX > HeroBoxX-(HeroBoxWidth/2) && mouseX < HeroBoxX+(HeroBoxWidth/2)) && (mouseY > HeroBoxY-(HeroBoxWidth/2) && mouseY < HeroBoxY+(HeroBoxWidth/2))))
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
        HeroBoxClicked = true;
        delay(100);
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