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

void GoodEnding()
{
  
}
