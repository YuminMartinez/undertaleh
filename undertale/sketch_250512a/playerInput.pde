boolean showSecondStage = false;




void keyPressed() {
  if (key == ' ' || keyCode == 32) {  // Si se presiona la barra espaciadora
    if (gameState == GameState.FIRST_STAGE) {
      gameState = GameState.TRANSITION;
        transitionX = 0;// Cambia al segundo estado
    }
  }
}
