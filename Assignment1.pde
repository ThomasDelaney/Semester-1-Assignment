import processing.sound.*;
import java.io.FileWriter;
import java.awt.Toolkit;
import java.awt.event.KeyEvent;

PImage bg;
PImage worldHome;

Logo athena1 = new Logo (375, 50, 400, true);
introScreen start = new introScreen();
homeScreen home = new homeScreen();
createUser registerUser = new createUser();
heroDatabase heroList = new heroDatabase();
heroPage h = new heroPage();

PFont overwatch;
PFont cred;
int state = 0;
int timer = 1;

int heroIndex;

boolean soundPlaying = false;
int SoundTimer = 1;

boolean timerReset = false;
boolean timerReset2 = false;

SoundFile theme;

String username;
String password;

String N_username;
String N_password;

ArrayList<Creds> UserLogin = new ArrayList<Creds>();
ArrayList<Creds> UserPass = new ArrayList<Creds>();

ArrayList<Creds> NewUserLogin = new ArrayList<Creds>();
ArrayList<Creds> NewUserPass = new ArrayList<Creds>();

ArrayList<User> CurrentUsers = new ArrayList<User>();

ArrayList<Hero> heroes = new ArrayList<Hero>();

ArrayList<heroBox> heroBoxes = new ArrayList<heroBox>();

int UserLoginSize;
int UserPassSize;

boolean UserLoginClicked = false;
boolean UserPassClicked = false;
boolean UserEnterClicked = false;
boolean CreateClicked = false;

boolean UserLoginClickedC = false;
boolean UserPassClickedC = false;
boolean UserEnterClickedC = false;

boolean userFound = false;
boolean userFoundC = false;

boolean heroSelect = false;
boolean mV = false;

float LoginCurX = 413;
float PassCurX = 413;

float LoginCurX2 = 413;
float PassCurX2 = 413;

float GenBoxX = 170;
float GenBoxY = 60;

FileWriter newUser = null;


void setup()
{
  size(1280,720);
  frameRate(60);
  smooth();
  
  drawBackground();
  bg = loadImage("background.jpg");
  worldHome = loadImage("world.png");
  worldHome.resize(1025, 570);
  overwatch = createFont("bignoodletoo.ttf", 150); 
  cred = createFont("koverwatch.ttf", 150); 
  theme = new SoundFile(this, "theme.mp3");
  theme.amp(0.7);
  textFont(overwatch);
  
  home.loadHeroes();
  home.loadLines();
  heroList.loadDB();
}
 
void draw()
{
  image(bg, 0, 0);
  
  if (frameCount % 60 == 0)
  {
    timer++;
    SoundTimer++;
    
    if (soundPlaying == false)
    {
      theme.play();
      soundPlaying = true;
    }
    
    if (SoundTimer >= 215)
    {
      soundPlaying = false;
      SoundTimer = 0;
    }
  }
  
  if (state == 0)
  {
    N_username = "";
    N_password = "";
      
    NewUserLogin.clear();

    NewUserPass.clear();
    
    LoginCurX2 = 413;
    PassCurX2 = 413;
   
    UserLoginClickedC = false;
    UserPassClickedC = false;
    UserEnterClickedC = false;
    
    userFoundC = false;
    
    heroSelect = false;
    mV = false;
    
    timerReset2 = false;

    start.loadLogin();
    
    if (timerReset == false)
    {
      timer = 0;
      timerReset = true;
    }
  }
  
  else if (state == 1)
  { 
    UserLoginClicked = false;
    UserPassClicked = false;
    UserEnterClicked = false;
      
    userFound = false;
    
    timerReset = false;
    
    if (timerReset2 == false)
    {
      timer = 0;
      timerReset2 = true;
    }
    
    if (timer < 4)
    {
      home.loadInHome();
    }
    else
    {
      home.drawHome(username);
    }
  }
  else if (state == 2)
  {
    UserLoginClicked = false;
    UserPassClicked = false;
    UserEnterClicked = false;
    
    userFound = false;
    
    registerUser.registerScreen();
  }
  else if (state == 3)
  {
    mV = false;
    heroSelect = false;
    heroList.displayDB();
    //println(heroIndex);
  }
  else if (state == 4)
  {
    h.printPage(heroIndex);
    stroke(255, 140, 0);
    h.printReturnBox();
  }
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
  
  save("background.jpg");
}