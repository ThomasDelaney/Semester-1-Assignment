void setup()
{
  size(1280,720);
  drawBackground();
  below = createFont("bignoodletoo.ttf", 150); 
  textFont(below);
}
 
void draw()
{
  if (UIState == 0)
  {
    start.loadLogin();
  }
  
  if (frameCount % 60 == 0)
  {
    println(timer);
    timer++;
  }
}

Logo athena1 = new Logo (375, 50, 400, true);
introScreen start = new introScreen();
PFont below;
int UIState = 0;
int timer = 0;

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