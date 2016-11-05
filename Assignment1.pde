import processing.sound.*;

void setup()
{
  size(1280,720);
  frameRate(60);
  
  drawBackground();
  bg = loadImage("background.jpg");
  delay(1000);
  below = createFont("bignoodletoo.ttf", 150); 
  introSound = new SoundFile(this, "loadingSound.mp3");
  textFont(below);
}
 
void draw()
{
  image(bg, 0, 0);
  
  if (frameCount % 60 == 0)
  {
    //println(timer);
    timer++;
    introSoundTimer++;
    
    if (introSoundTimer >= 29)
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
      introSound.loop();
      soundPlaying = true;
    }
  }
}

PImage bg;

Logo athena1 = new Logo (375, 50, 400, true);
introScreen start = new introScreen();
PFont below;
int state = 0;
int timer = 1;
char log_name[] = new char[10];
boolean soundPlaying = false;
int introSoundTimer = 1;


SoundFile introSound;


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