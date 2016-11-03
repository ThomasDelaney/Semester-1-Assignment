class introScreen
{   
  void loadLogin()
  {
      if (timer != 12)
      {
        color p = color(255, 140, 0);
        athena1.drawAthenaLogo(p);
        
        if (timer+2 % 2 == 0)
        {
          opState = 0;
        }
        else 
        {
          opState = 6;
        }
      }
  }
}