// Variables del menu del Player
boolean SoundGame = false;
boolean EndSound = false;
float posY_Dead = 0;
float posX_Dead = 0;
PImage GameOverScreen;
int aparicion =0;
float escalado = 30;

// Funcion de las acciones del player
void ActionsPlayer()
{
 PrintEnemy();
    secondStage();
    PrintVidaPNJ();
    if(actionSelected || ActMode || lunchTime || ReallyMercy)
    {
      switch(player_choose)
      {
      case 0:
          PJAttack();
          break;
       case 1:
         PJAct();
         break;
       case 2:
         PrintBackpack();
         break;
       case 3:
         TryToForgive();
         break;
      }
    }
    // Condiciones del boton de Item
    if(EatFood)
    {
      EatFood();
    }
    // Condiciones del boton de ACT
    if(CheckEnemy)
    {
      CheckStatsEnemy();
    }
    if(FindObject)
    {
      SearchObject();
    }
    // Condiciones del boton de Attack
    if(atackMode && !actionSelected && AtaqueRealizado == false)
      {
        PrintBarraAtaque();
      }
    else if (AtaqueRealizado == true)
      {
       PNJRecibirDaño(CalcularDañoPJ()); 
       AtaqueRealizado = false;
        ChangeToMain = true;
        timeTransition = millis();
       //MenuBattle = true;
       }

}

// Funcion para cuando el player pierde
void PlayerDefeat()
{
   // Paramos la musica y comenzamos la de muerte
   SoundTrack.pause();
   HeartBreak.play();   
   
   image(img,posX_Dead,posY_Dead,width/21.33f,height/13.5f);
   posY_Dead += height/100;
       
    
   if(posY_Dead >= height)
   {
     posY_Dead = height;
   }
   if(posY_Dead == height)
   {
     // Cuando el Daruma cae, aparece el texto de Game Over poco a poco
     tint(255,aparicion);
     pushMatrix(); 
      translate(width/4, height/4);  
      scale(escalado);  
      image(GameOverScreen, 0, 0, width/64, height/64);  
      popMatrix(); 
     textAlign(LEFT, LEFT);
     textSize(48);
     fill(255);
    text("You have died, but your determination prevents you from losing, face it again, you can" ,width/20,height/1.1f);
     if(aparicion >= 255)
     {
        aparicion = 255; 
     }
     else
     {
       aparicion += 5;
     }
   }
   
   
  
}
