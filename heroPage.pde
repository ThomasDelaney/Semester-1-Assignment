class heroPage
{
  heroDatabase heroDB = new heroDatabase();
  
  void displayDB()
  {
    heroDB.loadDB();
  }
}