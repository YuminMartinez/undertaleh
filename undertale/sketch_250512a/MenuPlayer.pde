
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
    if(EatFood)
    {
      EatFood();
    }
    if(CheckEnemy)
    {
      CheckStatsEnemy();
    }
    if(FindObject)
    {
      SearchObject();
    }
    
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
boolean SoundGame = false;
boolean EndSound = false;
float posY_Dead = 0;
float posX_Dead = 0;
PImage GameOverScreen;
int aparicion =0;


void PlayerDefeat()
{
   //image
   SoundTrack.pause();
   HeartBreak.play();   
   
   image(img,posX_Dead,posY_Dead,width/21.33f,height/13.5f);
   posY_Dead += height/100;
  // posY_Dead = scale(height/100);
   if(posY_Dead >= height)
   {
     posY_Dead = height;
   }
   if(posY_Dead == height)
   {
     tint(255,aparicion);
     image(GameOverScreen,width/4,height/4, width /2, height/2);
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
