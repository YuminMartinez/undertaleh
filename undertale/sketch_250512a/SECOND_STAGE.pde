// Variables globales para la transición
float transitionX = 0;
PImage img;

void secondStageTransition() {
  // Dibujar firstStage primero como fondo
  firstStage(); 

  // Dibujar barra que borra desde la izquierda
  noStroke();
  fill(0); // Color de "borrado", negro
  rect(0, 0, transitionX, height);

  // Avanza la barra
  transitionX += 20;

  // Cuando la barra cubre toda la pantalla, pasar a otro estado
  if (transitionX > width) {
    
    gameState = GameState.MENU;
  }
  MenuBattle = true;
   
}

int player_choose = 0;
boolean ChangeToMain = false;
boolean MenuBattle = false;
boolean actionSelected = false;
boolean atackMode = false;
boolean ActMode = false;
boolean AtaqueRealizado = false;
int PJMaxLife = 99;
int PJLife = PJMaxLife;
int LastPJLife = PJLife;
int barraAtaque;
float pXrojo = width/6;
float disRojo = width/1.5f;

void secondStage()
{ 
  if(actionSelected == false && ActMode == false)
  {
    switch(player_choose)
    {
      case 0:
        fill(255,165,0);
        rect(width/6,height/1.25f,width/8, height/16);
        img = loadImage("daruma.png");
        image(img, width/6,height/1.25f,width/21.33f,height/13.5f);
        break;
      case 1:
        fill(255,165,0);
        rect(width/3,height/1.25f,width/8, height/16);
        img = loadImage("daruma.png");
        image(img, width/3,height/1.25f,width/21.33f,height/13.5f);
        break;
      case 2:
        fill(255,165,0);
        rect(width/2,height/1.25f,width/8, height/16);
        img = loadImage("daruma.png");
        image(img, width/2,height/1.25f,width/21.33f,height/13.5f);
        break;
      case 3:
        fill(255,165,0);
        rect(width-width/3,height/1.25f,width/8, height/16);
        img = loadImage("daruma.png");
        image(img, width-width/3,height/1.25f,width/21.33f,height/13.5f);
        break;
    }
  }
    
    //rect(mouseX, mouseY, ancho_muro, alto_muro);
  
  // Boton 1
  drawRectWithText(width/6,height/1.25f,width/8, height/16, "Fight", 48);
  // Boton 2 
  drawRectWithText(width/3,height/1.25f,width/8, height/16, "Act", 48);
   // Boton 3 
  drawRectWithText(width/2,height/1.25f,width/8, height/16, "Item", 48);
   // Boton 4 
  drawRectWithText(width-width/3,height/1.25f,width/8, height/16, "Mercy", 48);
  // Barra de vida roja que indica la máxima capacidad
  fill(255,0,0);
  strokeWeight(0);
  rect(width/3.5f,height/1.13f,width/3.5f, height/20);
  // Barra de vida verde que indica la vida que le queda al player
  fill(0,255,0);
  strokeWeight(0);
  rect(width/3.5f,height/1.13f,PJLife*(width/3.5f)/PJMaxLife, height/20);
  textSize(48);
  fill(255);
  String HPrestante = " HP: " + PJLife;
  text(HPrestante,width/1.6f,height/1.1f);
 
}
