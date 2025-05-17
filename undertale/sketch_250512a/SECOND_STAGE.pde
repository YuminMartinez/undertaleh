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
}

int player_choose = 0;
boolean MenuBattle = false;
boolean Attack = false;
void secondStage()
{ 
   MenuBattle = true;
 
    switch(player_choose)
    {
      case 0:
        fill(255,165,0);
        rect(width/6,height/1.25f,width/8, height/16);
        img = loadImage("daruma.png");
        image(img, width/6,height/1.25f,90,80);
        break;
      case 1:
        fill(255,165,0);
        rect(width/3,height/1.25f,width/8, height/16);
        img = loadImage("daruma.png");
        image(img, width/3,height/1.25f,90,80);
        break;
      case 2:
        fill(255,165,0);
        rect(width/2,height/1.25f,width/8, height/16);
        img = loadImage("daruma.png");
        image(img, width/2,height/1.25f,90,80);
        break;
      case 3:
        fill(255,165,0);
        rect(width-width/3,height/1.25f,width/8, height/16);
        img = loadImage("daruma.png");
        image(img, width-width/3,height/1.25f,90,80);
        break;
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
  
  // Draw text zone to get info about the battle
  
   drawRectWithText(width-width/3,height/1.25f,width/8, height/16, "Mercy", 48);
 // img = loadImage("daruma.png");
 // image(img, width/2,height/2); // Dibuja la imagen en las coordenadas (0, 0
  
  
}
void PJAttack()
{
  noFill();
  stroke(255);
  strokeWeight(5);
  rect(width/6, height/1.8f,2*width/3, height/5);
  img = loadImage("daruma.png");
  image(img, width/3,height/1.25f,90,80);
  /*fill(255);
  textSize(80);
  textAlign(CENTER, CENTER);
  text("MONEDERO", 800, 400);*/
}
