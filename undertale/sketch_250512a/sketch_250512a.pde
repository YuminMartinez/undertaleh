import gifAnimation.*;
Gif miGif;

enum GameState { FIRST_STAGE,TRANSITION, SECOND_STAGE }
GameState gameState = GameState.FIRST_STAGE;

void setup(){
  size(1920, 1080); 
  frameRate(30);
  background(0); 
}

void draw() {
  background(0);

  
  switch(gameState) {
    case FIRST_STAGE:
      firstStage();
      break;
            
    case TRANSITION:
    secondStageTransition();
    break;
    
    case SECOND_STAGE:
    break;
      
 
  }
}
