int ActSelection = 0;
int vtext = 25;
int timeText = 0;
int lastTime = 0;
int CharNext = 0;
boolean CheckEnemy = false;
boolean Checktext1 = false;
boolean Checktext2 = false;
boolean FindObject = false;
boolean WeaponFinded = false;
void PJAct()
{
  noFill();
  stroke(255);
  strokeWeight(5);
  rect(width/6, height/1.8f,2*width/3, height/5);
  fill(255);
  textSize(48);
  text("Check Stats Enemy", width/3.2f, height/1.7f);
  text("Try to distract", width/3.5f, height/1.5f);
  switch(ActSelection)
  {
    case 0:
      img = loadImage("daruma.png");
      image(img, width/6, height/1.8f,width/21.33f,height/13.5f);
      break;
  case 1:
      img = loadImage("daruma.png");
      image(img, width/6, height/1.6f,width/21.33f,height/13.5f);
      break;
    
  }
}
void CheckStatsEnemy()
{
  
  noFill();
  stroke(255);
  strokeWeight(5);
  rect(width/6, height/1.8f,2*width/3, height/5);
  fill(255);
  textSize(48); 
  
  if(Checktext1)
  {
    timeText = millis();
    String wordStats = " This enemy is the strongest you have ever faced";
    if(CharNext < wordStats.length() && timeText - lastTime > vtext)
    {
      CharNext++;
      lastTime = timeText;
    }
    textAlign(LEFT, LEFT);
  String Visible = wordStats.substring(0,CharNext);
  text(Visible, width/4.9f, height/1.6f);
  if(wordStats.length() == Visible.length())
  {
    CharNext = 0;
  }
  }
  if(Checktext2)
  {
    timeText = millis();
    String EnemyStats = " Remains Enemy HP is: "+ vidaPNJ ;
    if(CharNext < EnemyStats.length() && timeText - lastTime > vtext)
    {
      CharNext++;
      lastTime = timeText;
    }
    textAlign(LEFT, LEFT);
    String Visible = EnemyStats.substring(0,CharNext);
    text(Visible, width/4.9f, height/1.6f);
    if(EnemyStats.length() == Visible.length())
  {
    CharNext = 0;
  }
  }
  
}
void SearchObject()
{
  int possibility = (int)random(1,4);
  noFill();
  stroke(255);
  strokeWeight(5);
  rect(width/6, height/1.8f,2*width/3, height/5);
  if(possibility == 4)
  {
    WeaponFinded = true; 
  }
}
