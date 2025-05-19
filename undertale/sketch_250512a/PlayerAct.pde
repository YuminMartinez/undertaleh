int ActSelection = 0;
boolean CheckEnemy = false;
boolean Checktext1 = false;
boolean Checktext2 = false;
boolean FindObject = false;
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
  String wordStats = " This enemy is the strongest you have ever faced";
  text(wordStats, width/2.2f, height/1.6f);
  }
  if(Checktext2)
  {
    String EnemyStats = " Remains Enemy HP is: " + vidaPNJ ;
    text(EnemyStats, width/3, height/1.6f);
  }
}
