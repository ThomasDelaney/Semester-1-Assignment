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
  int layerCount = 0;
  
  color from = color(12, 16, 32);
  color to = color(22, 70, 131);
  
  noStroke();
  
  while(y < height)
  {
    while (x < width)
    {
      color newCol = lerpColor(from, to, x/10000);
      fill(newCol);
      rect(x, y, 20, 20);
      x+=2;
      layerCount++;
    }
    y+=2;
    x = 0;
  }
}