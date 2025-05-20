//import gifAnimation.*;
//Gif miGif;
enum GameState { FIRST_STAGE,TRANSITION, SECOND_STAGE }
GameState gameState = GameState.FIRST_STAGE;

void setup(){
  size(1920, 1080); 
  frameRate(30);
  background(0); 
  barraAtaque = width/6;
  pXrojo = width/6;
  disRojo = width/1.5f;
}

void draw() 
{
  frameRate(30);
  background(0);
  
// si llamamos a esta funcion durante el combate, podemos hacer que el jugador se mueva por la batalla si mantenemos presionada la tecla  keyPressed();
  switch(gameState) 
  {
    case FIRST_STAGE:
      firstStage();
      break;
            
    case TRANSITION:
    secondStageTransition();
    break;
    
    case SECOND_STAGE:
    PrintEnemy();
    secondStage();
    PrintVidaPNJ();
    if(actionSelected || ActMode || lunchTime)
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
       case 3:
       
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
       MenuBattle = true;
       }
    if(ChangeToMain)
      {
        ChangeToMain = false;
        MenuBattle = true;
      }
    break;
  }
 if(PJLife > PJMaxLife)
 {
   PJLife = PJMaxLife;
 }
 else if(PJLife < 0)
 {
   PJLife = 0;
 }
 
}
