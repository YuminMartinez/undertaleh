int ActSelection = 0;
int vtext = 25;
int timeText = 0;
int lastTime = 0;
int CharNext = 0;
int possibility = 0;
boolean ended = false;
boolean firstSearch = false;
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
    if(!ended)
    {
    if(CharNext < wordStats.length() && timeText - lastTime > vtext)
    {
      CharNext++;
      lastTime = timeText;
    }
    }
    textAlign(LEFT, LEFT);
  String Visible = wordStats.substring(0,CharNext);
  text(Visible, width/4.9f, height/1.6f);
  if(wordStats.length() == Visible.length())
  {
    
    ended = true;
  }
  }
  if(Checktext2)
  {
    timeText = millis();
    String EnemyStats = " Remains Enemy HP is: "+ vidaPNJ ;
    if(!ended)
    {
    if(CharNext < EnemyStats.length() && timeText - lastTime > vtext)
    {
      CharNext++;
      lastTime = timeText;
    }
    }
    textAlign(LEFT, LEFT);
    String Visible = EnemyStats.substring(0,CharNext);
    text(Visible, width/4.9f, height/1.6f);
    if(EnemyStats.length() == Visible.length())
  {
   
    ended = true;
  }
  }
  
}
void SearchObject()
{
  if(firstSearch == false)
  {
     possibility = (int)random(1,5);
     firstSearch = true;
  }
  noFill();
  stroke(255);
  strokeWeight(5);
  rect(width/6, height/1.8f,2*width/3, height/5);
  if(possibility == 4 && WeaponFinded == false)
  {
   
     
    timeText = millis();
    String SwordFinded = "You've got a sword, now you hit harder";
    if(!ended)
    {
    if(CharNext < SwordFinded.length() && timeText - lastTime > vtext)
    {
      CharNext++;
      lastTime = timeText;
    }
    }
    textAlign(LEFT, LEFT);
    String Visible = SwordFinded.substring(0,CharNext);
    text(Visible, width/4.9f, height/1.6f);
    if(SwordFinded.length() == Visible.length())
      {
        ended = true;
      }
    
  }
  else if(possibility < 4 || WeaponFinded == true)
  {
    timeText = millis();
    String TryFind = "You search but can't find anything in the room";
    if(!ended)
    {
    if(CharNext < TryFind.length() && timeText - lastTime > vtext)
    {
      CharNext++;
      lastTime = timeText;
    }
    }
    textAlign(LEFT, LEFT);
    String Visible = TryFind.substring(0,CharNext);
    text(Visible, width/4.9f, height/1.6f);
    if(TryFind.length() == Visible.length())
      {
        ended = true;
      }
  }
}
