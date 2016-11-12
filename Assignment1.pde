import processing.sound.*;

void setup()
{
  size(1280,720);
  frameRate(60);
  
  drawBackground();
  bg = loadImage("background.jpg");
  overwatch = createFont("bignoodletoo.ttf", 150); 
  cred = createFont("koverwatch.ttf", 150); 
  introSound = new SoundFile(this, "loadingSound.mp3");
  textFont(overwatch);
}
 
void draw()
{
  image(bg, 0, 0);
  
  if (frameCount % 60 == 0)
  {
    //println(timer);
    timer++;
    introSoundTimer++;
    
    if (introSoundTimer >= 28 && state == 0)
    {
      soundPlaying = false;
      introSoundTimer = 0;
    }
  }
  
  if (state == 0)
  {
    start.loadLogin();
    
    if(soundPlaying == false)
    {
      introSound.play();
      soundPlaying = true;
    }
  }
  
  if (state == 1)
  {
    if (song1Ended == false)
    {
      song1Ended = true;
      introSound.stop();
    }
    if (timerReset == false)
    {
      timer = 0;
      timerReset = true;
    }
    
    if (timer < 4)
    {
      home.loadInHome();
    }
    else
    {
      home.drawHome(username);
    }
  }
}

PImage bg;

Logo athena1 = new Logo (375, 50, 400, true);
introScreen start = new introScreen();
homeScreen home = new homeScreen();

PFont overwatch;
PFont cred;
int state = 0;
int timer = 1;

boolean soundPlaying = false;
int introSoundTimer = 1;
boolean timerReset = false;

boolean song1Ended = false;

SoundFile introSound;

String username;
String password;

void drawBackground()
{
  float x = 0;
  float y = 0;
  float rectCount = 0;
  
  color from = color(12, 16, 32);
  color to = color(16, 63, 115);
  
  boolean half = false;
  
  noStroke();
  
  while (y < height)
  {
    while (x < width)
    {
      if (!half)
      {
        color newCol = lerpColor(from, to, rectCount/500);
        fill(newCol);
        
        if (rectCount > width/2)
        {
          rectCount = 0;
          half = true;
        }
      }
      else
      {
        color newCol = lerpColor(to, from, rectCount/300);
        fill(newCol);
      }
      
      rect(x, y, 5, 5);
      x++;
      rectCount++;
    }
    y++;
    x = 0;
    rectCount = 0;
    half = false;
  }
  
  save("background.jpg");
}