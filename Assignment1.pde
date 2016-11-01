void setup()
{
  size(1280,720);
  background(0);
  smooth();
  PFont below;
  below = loadFont("koverwatch.ttf"); 
  textFont(below, 100);
}

PFont name;

void draw()
{
  //over1.drawOverwatchLogo();
  
 //name = createFont("koverwatch.ttf", 100);

  //textFont(name);
  //fill(255);
  //text("WNSTN", 12, 60);
  
  Logo athena = new Logo (300,300,300, color(16, 63, 115), true);
  athena.drawAthenaLogo();
  
}

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
}