import ddf.minim.*;
Minim minim;
AudioPlayer SoundTrack;
AudioPlayer GameOver;
AudioPlayer HeartBreak;
AudioPlayer BebeCeniza;
boolean SoundisON = false;
PImage SpriteEnemy1;
PImage SansInicio;
//import gifAnimation.*;
//Gif miGif;
int timeTransition = 0;
//VARIABLES GLOBALES
enum GameState { FIRST_STAGE,TRANSITION, MENU,FIRST_SANSATTACK ,SECOND_SANSATTACK,THIRD_SANSATTACK, ENEMY_DEFEAT, PLAYER_DEFEAT}
GameState gameState = GameState.FIRST_STAGE;
boolean TrAttack = false;
enum GameControl { RATON, CLICK_RATON }

GameControl gameControl = GameControl.CLICK_RATON;



int nivel = 1;
  
void setup(){
  SansDefeated = loadImage("SansDefeat.png");
  EnemyShuriken = loadImage("NinjaSans.png"); 
  size(1920, 1080); 
  frameRate(30);
  background(0); 
  barraAtaque = width/6;
    posY_Dead = height/2;
    posX_Dead = width/2;
    SansInicio = loadImage("sansInicio.png");
    darumaImg = loadImage("daruma.png"); 
    DarumaFeito = RecibeDaño(darumaImg);
    daruma = new Daruma( 908, 562.91, width/29.33f,height/25.5f, darumaImg);
    // Carga las imágenes 
  
    toriil = loadImage("toriil.png");
     GameOverScreen = loadImage("GameOverScreen.png"); 
  refreshAttackOne();
  pXrojo = width/6;
  disRojo = width/1.5f;
  minim = new Minim(this);
  SoundTrack = minim.loadFile("SoundTrack.mp3");
  HeartBreak = minim.loadFile("DeathSound.mp3");
  BebeCeniza = minim.loadFile("BebeCeniza.mp3");
  HeartBreak.setGain(-20);
  SoundTrack.setGain(-20);
  BebeCeniza.setGain(-20);
  SpriteEnemy1 = loadImage("SansSamurai.png");
  
}

void draw() 
{
  frameRate(30);
  background(0);
      
  if (CanMove == true) {
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
    
    case MENU:
    if(SoundisON == false)
    {
      SoundTrack.loop();
      SoundisON = true;
     
    }
     ActionsPlayer(); 
    break;
    
    case FIRST_SANSATTACK:
     PrintEnemy();
     PrintVidaPNJ();
     secondStage();
     attackone();
     
   
    break;
     
    case SECOND_SANSATTACK:
      CanMove = false;
     PrintEnemy();
     PrintVidaPNJ();
     secondStage();
     SecondAttack();
     if(millis() - Duration2ndAttack > 10000)
      {
          gameState = GameState.MENU;
          Reset2ndRound();
          MenuBattle = true;
      }
    break;
    
    case  THIRD_SANSATTACK:
      PrintEnemy();
      secondStage();
      PrintVidaPNJ();
      DodgeAttack();
      if(millis() - timeAttack > 10000)
      {
          gameState = GameState.MENU;
          ResetAtt3();
          MenuBattle = true;
      }
    break;
          
    case ENEMY_DEFEAT:
      GoodEnding();
      break;
    case PLAYER_DEFEAT:
     PlayerDefeat();
      break;  
  }
   
 if(PJLife > PJMaxLife)
 {
   PJLife = PJMaxLife;
 }
 else if(PJLife <= 0)
 {
    PJLife = 0;
    MenuBattle = false;
    ChangeToMain = false;
   gameState = GameState.PLAYER_DEFEAT;     
 }
 if(vidaPNJ <=0)
 {
   gameState = GameState.ENEMY_DEFEAT;
    MenuBattle = false;
    ChangeToMain = false;
 }
  if(ChangeToMain)
      {
        if(nivel > 3)
        {
            nivel = 1;
            TrAttack = false;
            
        }
         if(millis() - timeTransition > 1000 && nivel == 3)
        {
          ChangeToMain = false;
          
         //MenuBattle = true;
         gameState = GameState.THIRD_SANSATTACK;
         nivel++;
         TrAttack = true;
        }
        if(millis() - timeTransition > 1000 && nivel == 2)
        {
        ChangeToMain = false;
         //MenuBattle = true;
       gameState = GameState.SECOND_SANSATTACK;
       TrAttack = false;
      
       nivel++;
        }
        if(millis() - timeTransition > 1000 && nivel == 1)
        {
        ChangeToMain = false;
        TrAttack = false;
         //MenuBattle = true;
       gameState = GameState.FIRST_SANSATTACK;
         refreshAttackOne();
       nivel++;
        }
         
        
      }  
}
