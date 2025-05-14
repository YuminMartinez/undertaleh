// Variables globales para la transición
float transitionX = 0;

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
