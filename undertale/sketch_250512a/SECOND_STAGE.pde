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
    
     gameState = GameState.SECOND_STAGE;
  }
  MenuBattle = true;
}

int player_choose = 0;
boolean MenuBattle = false;
boolean actionSelected = false;
boolean atackMode = false;
boolean AtaqueRealizado = false;
int PJMaxLife = 99;
int PJLife = PJMaxLife;
int barraAtaque;
float pXrojo = width/6;
float disRojo = width/1.5f;
void secondStage()
{ 
  if(actionSelected == false)
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
void PJAttack()
{
  noFill();
  stroke(255);
  strokeWeight(5);
  rect(width/6, height/1.8f,2*width/3, height/5);
  img = loadImage("daruma.png");
  image(img, width/6, height/1.6f,width/21.33f,height/13.5f);
  fill(255);
  textSize(48);
  text("*Insertar Nombre enemigo*", width/2.8f, height/1.5f);
}
void PrintBarraAtaque()
{
  // Ataque flojo
  fill(255,0,0);
  stroke(255);
  strokeWeight(5);
  rect(pXrojo,height/1.8f,disRojo, height/5);
  // Ataque medio
  fill(255,255,0);
  strokeWeight(0);
  rect(pXrojo+disRojo*0.3f,height/1.8f,disRojo*0.4f, height/5);
  // Ataque fuerte
   fill(0,255,0);
  strokeWeight(0);
  rect(pXrojo+disRojo*0.45f,height/1.8f,disRojo*0.1f, height/5);
  //width*0.4f
  fill(255);
   stroke(0);
  strokeWeight(7);
  rect(barraAtaque,height/1.8f,20, height/5);
  barraAtaque+= 30;
  if(barraAtaque >=width*0.84f)
  {
    atackMode = false;
    MenuBattle = true;
    barraAtaque = width/6;
  }
  
}

int  CalcularDañoPJ()
{
  int dmg = 0;
  float zonaRojaInicio = pXrojo;
  float zonaRojaFin = pXrojo + disRojo * 0.3f;
  
  float zonaAmarillaInicio = pXrojo + disRojo * 0.3f;
  float zonaAmarillaFin = pXrojo + disRojo * 0.7f;
  
  float zonaVerdeInicio = pXrojo + disRojo * 0.45f;
  float zonaVerdeFin = pXrojo + disRojo * 0.55f;

  if ((barraAtaque >= zonaRojaInicio && barraAtaque < zonaRojaFin) || (barraAtaque >=zonaAmarillaFin && barraAtaque <=pXrojo+disRojo)) 
  {
    dmg = (int)random(10, 20);
  } 
  if (barraAtaque >= zonaAmarillaInicio && barraAtaque < zonaAmarillaFin) 
  {
    dmg = (int)random(30, 50);
  } 
  if (barraAtaque >= zonaVerdeInicio && barraAtaque < zonaVerdeFin) 
  {
    dmg = (int)random(60, 90);
  } 
  barraAtaque = width/6;
  return dmg;
}
