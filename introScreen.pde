class introScreen
{ 
  color p = color(255,140,0, 3);
  
  void loadLogin()
  {
      if (timer != 6)
      {
        athena1.drawAthenaLogo(p);
        //filter( BLUR, 6 );
      }
  }
}