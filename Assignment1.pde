void setup()
{
  size(1280,720);
  background(0);
  smooth();
  drawBackground();
}

PFont name;

void draw()
{
  //Overwatch_Logo logo1 = new Overwatch_Logo(300,300,400, color(100));
  //logo1.drawLogo();
  /*
  name = createFont("koverwatch.ttf", 100);

  textFont(name);
  fill(255);
  text("WNSTN", 12, 60);*/
}

void drawBackground()
{
  float x = 0;
  float y = 0;
  float rectCount = 0;
  
  color from = color(12, 16, 32);
  color to = color(22, 70, 131);
  
  boolean half = false;
  noStroke();
  
  while(y < height)
  {
    while (x < width)
    {
      if (!half)
      {
        if (rectCount > width/2)
        {
          rectCount = 0;
          half = true;
        }
        
        color newCol = lerpColor(from, to, rectCount/500);
        fill(newCol);
      }
      else
      {
        color newCol = lerpColor(to, from, rectCount/500);
        fill(newCol);
      }
      
      rect(x, y, 10, 10);
      x++;
      rectCount++;
    }
    y++;
    x = 0;
    rectCount = 0;
    half = false;
  }
}