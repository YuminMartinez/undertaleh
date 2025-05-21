//import gifAnimation.*;
//Gif miGif;

//VARIABLES GLOBALES
enum GameState { FIRST_STAGE,TRANSITION, SECOND_STAGE, SECOND_SANSATTACK }
GameState gameState = GameState.FIRST_STAGE;

enum GameControl { RATON, CLICK_RATON }

GameControl gameControl = GameControl.RATON;

  
void setup(){
  size(1920, 1080); 
  frameRate(30);
  background(0); 
  barraAtaque = width/6;
    
    darumaImg = loadImage("daruma.png"); 
    daruma = new Daruma( 908, 562.91, width/29.33f,height/25.5f, darumaImg);
    // Carga las imágenes (¡asegúrate de tener los archivos en /data/!)
  inicializarCurvasShuriken();
  katanas_iniciar();
   inicializarSakurasShurikenFase();
    toriil = loadImage("toriil.png");
   

}

void draw() 
{
  frameRate(30);
  background(0);
      
  if (gameControl == GameControl.RATON) {
    daruma.x = mouseX - daruma.sizeX / 2;
    daruma.y = mouseY - daruma.sizeY / 2;
  }

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
     // attackone();
      // Solo mostrar bolas si el sistema está activo
    
   SecondAttack();
  
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
