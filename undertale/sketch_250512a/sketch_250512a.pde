// Librerias y Variables
import ddf.minim.*;
Minim minim;
AudioPlayer SoundTrack;
AudioPlayer GameOver;
AudioPlayer HeartBreak;
AudioPlayer BebeCeniza;
boolean SoundisON = false;
PImage SpriteEnemy1;
PImage SpriteEnemy2;
PImage SansInicio;
int timeTransition = 0;
//VARIABLES GLOBALES
enum GameState { FIRST_STAGE,TRANSITION, MENU,FIRST_SANSATTACK ,SECOND_SANSATTACK,THIRD_SANSATTACK, ENEMY_DEFEAT, PLAYER_DEFEAT}
GameState gameState = GameState.FIRST_STAGE;
boolean TrAttack = false;
enum GameControl { RATON, CLICK_RATON }
GameControl gameControl = GameControl.RATON;
int nivel = 1;
  
void setup() 
{
  // Definir Los PNG, MP3 y las variables que dependan de el ancho y alto de la pantalla
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
  SpriteEnemy2 = loadImage("SansSamurai.png");
  
}

void draw() 
{
  // Limitamos el juego a 30 fps
  frameRate(30);
  background(0);
  
  if (CanMove == true) 
  {
    daruma.x = mouseX - daruma.sizeX / 2;
    daruma.y = mouseY - daruma.sizeY / 2;
  }
  // Este Switch Sirve para saber que escenas imprimir en pantalla  
  switch(gameState) 
  {
    // Caso de la pantalla inicial, donde se muestra los colaboradores de la práctica
    case FIRST_STAGE:
      firstStage();
      break;
     // Caso de la transicon de la pantalla inicial a el menú del jugador
    case TRANSITION:
    secondStageTransition();
    break;
     // Caso del menú del jugador, donde podrá eleguir las 4 opciones como en Undertale
    case MENU:
    // Para que se active la musica durante todo la batalla en bucle
    if(SoundisON == false)
    {
      SoundTrack.loop();
      SoundisON = true;
     
    }
     ActionsPlayer(); 
    break;
    // Caso del Primer ataque de Sans
    case FIRST_SANSATTACK:
     PrintEnemy();
     PrintVidaPNJ();
     secondStage();
     attackone();
     
   
    break;
     // Caso del segundo ataque de Sans
    case SECOND_SANSATTACK:
     CanMove = false;
     PrintEnemy();
     PrintVidaPNJ();
     secondStage();
     SecondAttack();
     // El ataque durará 10 segundos
     if(millis() - Duration2ndAttack > 10000)
      {
          gameState = GameState.MENU;
          Reset2ndRound();
          MenuBattle = true;
      }
    break;
    // Caso del tercer ataque de Sans
    case  THIRD_SANSATTACK:
      PrintEnemy();
      secondStage();
      PrintVidaPNJ();
      DodgeAttack();
      // El ataque durará 10 segundos
      if(millis() - timeAttack > 10000)
      {
          gameState = GameState.MENU;
          ResetAtt3();
          MenuBattle = true;
      }
    break;
    // Caso de que el Jugador consiga derrotar a Sans      
    case ENEMY_DEFEAT:
      GoodEnding();
      break;
    // Caso de que Sans derrote al Jugador
    case PLAYER_DEFEAT:
     PlayerDefeat();
      break;  
  }
  // Condiciones para pasar o al PLATER_DEFEAT o al ENEMY_DEFEAT
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
 // Despues de que el jugador realize su accion, passará a un ataque
  if(ChangeToMain)
      {
        if(nivel > 3)
        {
            nivel = 1;
            TrAttack = false;
            refreshAttackOne();
        }
         if(millis() - timeTransition > 1000 && nivel == 3)
        {
          DañoMostrado = false;
          ChangeToMain = false;
          
         //MenuBattle = true;
         gameState = GameState.THIRD_SANSATTACK;
         nivel++;
         TrAttack = true;
         PrintEnemy();
        }
        if(millis() - timeTransition > 1000 && nivel == 2)
        {
        DañoMostrado = false;
        ChangeToMain = false;
         //MenuBattle = true;
       gameState = GameState.SECOND_SANSATTACK;
       TrAttack = false;
      PrintEnemy();
       nivel++;
        }
        if(millis() - timeTransition > 1000 && nivel == 1)
        {
        DañoMostrado = false;
        ChangeToMain = false;
        TrAttack = false;
        PrintEnemy();
        
         //MenuBattle = true;
       gameState = GameState.FIRST_SANSATTACK;
       refreshAttackOne();
       nivel++;
        }
      }  
     
}
