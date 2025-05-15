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


void secondStage()
{
  img = loadImage("daruma.png");
  image(img, width/2,height/2); // Dibuja la imagen en las coordenadas (0, 0
  
}
