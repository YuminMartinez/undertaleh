int MaxvidaPNJ = 1000;
int vidaPNJ = MaxvidaPNJ;
int dmg = 1;
PImage Enemy;
boolean DañoMostrado = false; 
int tiempoDañoMostrado = 0;
int dañoDelJugador = 0;
PImage EnemyShuriken;
void PrintEnemy()
{
  if (bezzerSuperado == false)
  {
  image(SpriteEnemy1, width/3, height/9,width/3,height/1.5f);
  }
  else if(bezzerSuperado == true)
  {
    image(EnemyShuriken, width/3, height/9,width/3,height/1.5f);
  }
  
}
void PrintVidaPNJ()
{
  if (DañoMostrado) 
  {
    textSize(48);
    fill(255, 0, 0);
    text(dañoDelJugador, width/2, height/6);
    
    // Si han pasado más de 1000ms (1 segundo), oculta el daño
    if (millis() - tiempoDañoMostrado > 1000) 
    {
      DañoMostrado = false;
    }
  
  fill(255,0,0);
  strokeWeight(0);
  rect(width/3.5f,height/24,width/3.5f, height/20);
  // Barra de vida verde que indica la vida que le queda al Enemigo
  fill(0,255,0);
  strokeWeight(0);
  rect(width/3.5f,height/24,vidaPNJ*(width/3.5f)/MaxvidaPNJ, height/20);
  }
}
void PNJRecibirDaño(int dmg)
{
  dañoDelJugador = dmg;
  vidaPNJ -= dmg;
  if(vidaPNJ < 0)
  {
     vidaPNJ = 0; 
  } 
  DañoMostrado = true;
  tiempoDañoMostrado = millis();
}
PImage SansDefeated;
float translateSans = 1;
float posXSansDefeated = 10;
float FinalposX;
boolean esc1 = false;
boolean Defeat = false;
boolean esc2 = false;
boolean bbCeniza = false;
void GoodEnding()
{
  if(!Defeat)
  {
    if(translateSans < 1.15)
  {
  SoundTrack.pause();
  pushMatrix();
  scale(translateSans);
  image(SansDefeated, width/3,height/9,width/3,height/1.5f);
 
  popMatrix();
  translateSans+= 0.002;
  
  }
  
  else if( width/2.5f-((width/3*translateSans)-posXSansDefeated) < width/8.5f)
  {
    
  pushMatrix();
  translate(-posXSansDefeated,0);
  image(SansDefeated, width/3*translateSans,height/9*translateSans,width/3*translateSans,height/1.5f*translateSans);
  posXSansDefeated+=2;
  FinalposX = width/3*translateSans -posXSansDefeated;
  popMatrix();
  }
  else
  {
    esc1 = true;
    Defeat = true;
    aparicion = 255;
  }
  }
  if(esc1)
  {
    image(SansDefeated, FinalposX,height/9*translateSans,width/3*translateSans,height/1.5f*translateSans);
    stroke(255);
    strokeWeight(5);
    fill(0);
    rect(width/6, height/1.4f,2*width/3, height/5);
    fill(255);
    textSize(48); 
      timeText = millis();
      String wordStats = "You have defeated me, how is it possible?";
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
    text(Visible, width/4.9f, height/1.3f);
    if(wordStats.length() == Visible.length())
    {
      ended = true;    
    }
  
  }
  if(!esc1 && esc2 )
  {
    
    tint(255,aparicion);
    image(SansDefeated, FinalposX,height/9*translateSans,width/3*translateSans,height/1.5f*translateSans);
    if(aparicion <= 0 )
     {
      stroke(255);
      strokeWeight(5);
      fill(0);
      rect(width/6, height/1.4f,2*width/2.7f, height/5);
      fill(255);
      textSize(48); 
      textAlign(LEFT, LEFT);
      text("Thanks for playing our Undertale recreation, we hope you liked it.", width/4.9f, height/1.3f);
        aparicion = 0; 
     }
     else
     {
       aparicion -= 5;
     }
     if(aparicion <100 && bbCeniza == false)
     {
       BebeCeniza.play();
       bbCeniza = true;
     }
  }
  
  
  
   
}
