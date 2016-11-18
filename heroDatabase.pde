class heroDatabase
{
  void loadDB()
  {
    GenBoxX = 170;
    GenBoxY = 60;
    
    Table HeroTable = loadTable("heroes.txt", "tsv");
  
    int rowCount = HeroTable.getRowCount();
  
    for(int i = 0; i < rowCount; i++)
    {
      Hero e = new Hero(HeroTable.getString(i,0), HeroTable.getString(i,1), HeroTable.getFloat(i,2), HeroTable.getFloat(i,3), HeroTable.getString(i,4), HeroTable.getString(i,5), HeroTable.getString(i,6));
      heroes.add(e);
   
      heroBox h = new heroBox(e);
      
      h.BoxX = GenBoxX;
      h.BoxY = GenBoxY;
      
      if (GenBoxY+100 > height)
      {
        GenBoxY = 60;
        GenBoxX += 300;
      }
      else
      {
        GenBoxY += 100;
      }
      
      heroBoxes.add(h);
      h.checkBox();
    }
  }
}