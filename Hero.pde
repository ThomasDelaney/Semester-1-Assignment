class Hero
{
  PImage portrait;
  SoundFile greeting;
  int index;
  String name;
  String birthplace;
  float lat; //lattitude
  float longit; //longitude
  String member; //member of overwatch?
  String alive; //are they still alive?
  String base; //they're designated overwatch base
  float x;
  float y;
  
  ArrayList<sineGraph> waves = new ArrayList<sineGraph>();
  ArrayList<pieChart> pies = new ArrayList<pieChart>();
  
  barChart b = new barChart();
  
  Hero(String name, String birthplace, float lat, float longit, String member, String alive, String base, int index)
  {
    this.name = name;
    this.birthplace = birthplace;
    this.lat = lat;
    this.longit = longit;
    this.member = member;
    this.alive = alive;
    this.base = base;
    this.index = index;
    portrait = loadImage(name+".png");
    portrait.resize(325, 425);
    greeting = new SoundFile(Assignment1.this, name+".mp3");
    
    float h;
    float angle;
    
    h = random(10, 50);
    angle = random(0.01, 0.1);
    
    sineGraph w1 = new sineGraph(color(255, 0, 0), h, angle);
   
    h = random(10, 50);
    angle = random(0.01, 0.1);
    
    sineGraph w2 = new sineGraph(color(0, 255, 0), h, angle);
  
    
    h = random(10, 50);
    angle = random(0.01, 0.1);
    
    sineGraph w3 = new sineGraph(color(0, 0, 255), h, angle);
  
    h = random(10, 50);
    angle = random(0.01, 0.1);
    
    sineGraph w4 = new sineGraph(color(255, 255, 0), h, angle);
    
    waves.add(w1);
    waves.add(w2);
    waves.add(w3);
    waves.add(w4);
   }
  
  void mapGPS(float boxX, float boxY, float boxWidth, float boxHeight)
  {
    x = map(longit, -180, 180, boxX, boxX+boxWidth);
    y = map(lat, -85, 85, boxY, boxY+boxHeight);
  }
  
  String toString()
  {
    return name+" "+birthplace+" "+lat+" "+longit+" "+member+" "+base;
  }
}