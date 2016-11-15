class Hero
{
  String name;
  String birthplace;
  float lat; //lattitude
  float longit; //longitude
  String member; //member of overwatch?
  String alive; //are they still alive?
  String base; //they're designated overwatch base
  float x;
  float y;
  
  Hero(String name, String birthplace, float lat, float longit, String member, String alive, String base)
  {
    this.name = name;
    this.birthplace = birthplace;
    this.lat = lat;
    this.longit = longit;
    this.member = member;
    this.alive = alive;
    this.base = base;
  }
  
  void mapGPS(float boxX, float boxY, float boxWidth, float boxHeight)
  {
    x = map(longit, -180, 180, boxX, boxX+boxWidth);
    y = map(lat, 85, -85, boxY, boxY+boxHeight);
  }
  
  String toString()
  {
    return name+" "+birthplace+" "+lat+" "+longit+" "+member+" "+base;
  }
}