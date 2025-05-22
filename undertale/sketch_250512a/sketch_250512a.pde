import ddf.minim.*;
Minim minim;
AudioPlayer SoundTrack;
boolean SoundisON = false;
PImage SpriteEnemy1;
//import gifAnimation.*;
//Gif miGif;
int timeTransition = 0;
//VARIABLES GLOBALES
enum GameState { FIRST_STAGE,TRANSITION, SECOND_STAGE,PNJ_ATTACK ,SECOND_SANSATTACK }
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
   

  pXrojo = width/6;
  disRojo = width/1.5f;
  minim = new Minim(this);
  SoundTrack = minim.loadFile("SoundTrack.mp3");
  SoundTrack.setGain(-20);
  SpriteEnemy1 = loadImage("SansSamurai.png");
  
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
  switch(gameState) 
  {
    case FIRST_STAGE:
      firstStage();
      break;
      
         
    case TRANSITION:
    secondStageTransition();
    break;
    
    case SECOND_STAGE:
    if(SoundisON == false)
    {
      SoundTrack.loop();
      SoundisON = true;
     
    }
     ActionsPlayer();
       
    break;
    
    case PNJ_ATTACK:
     PrintEnemy();
    secondStage();
    PrintVidaPNJ();
    attackone();
      
  }
  
 if(PJLife > PJMaxLife)
 {
   PJLife = PJMaxLife;
 }
 else if(PJLife < 0)
 {
   PJLife = 0;
 }
 
  if(ChangeToMain)
      {
        if(millis() - timeTransition > 1000)
        {
        ChangeToMain = false;
         //MenuBattle = true;
       gameState = GameState.PNJ_ATTACK;
        }
      }  
}
