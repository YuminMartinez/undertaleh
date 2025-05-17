//import gifAnimation.*;
//Gif miGif;
enum GameState { FIRST_STAGE,TRANSITION, SECOND_STAGE }
GameState gameState = GameState.FIRST_STAGE;


void setup(){
  size(1920, 1080); 
  frameRate(30);
  background(0); 
  barraAtaque = width/6;
}

void draw() 
{
  frameRate(30);
  background(0);
  
// si llamamos a esta funcion durante el combate, podemos hacer que el jugador se mueva por la batalla si mantenemos presionada la tecla  keyPressed();
  switch(gameState) {
    case FIRST_STAGE:
      firstStage();
      break;
            
    case TRANSITION:
    secondStageTransition();
    break;
    
    case SECOND_STAGE:
    PrintEnemy();
    secondStage();
    if(actionSelected)
    {
      switch(player_choose)
      {
      case 0:
          PJAttack();
          break;
       case 1:
       case 2:
       case 3:
       
      }
    }
    if(atackMode && !actionSelected)
    {
     // PrintBarraAtaque();
      attackone();
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

void EnemySelected()
{
  
}
