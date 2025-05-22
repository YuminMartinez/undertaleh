PImage toriil;
enum PositionRect { IZQUIERDA, DERECHA, ARRIBA, ABAJO }

boolean SecondStageActive = false;
PositionRect positionRect;

void SecondAttack() {
  SecondStageActive = true;
  gameControl = GameControl.CLICK_RATON;

  // Dibujar fondo y elementos estáticos
  image(toriil, width / 2, height / 2, 100, 100);

  // Dibujar el cuadrado de ataque
  noFill();
  stroke(255);  // Borde blanco estilo Undertale
  strokeWeight(3);  
  float lado = width * 0.15f;  // Tamaño del cuadrado
  float xPos = (width / 3 + width / 2) / 2 - lado / 2 + 180;
  float yPos = height / 2.2f; 
  rect(xPos, yPos, lado, lado);  

  // Solo limitar movimiento si NO está saltando
  if (!estaSaltando) {
    daruma.limitarMovimiento(xPos, yPos, xPos + lado, yPos + lado);

    // Posición inicial del Daruma y zona de ataque
    int offset = 5;
    noFill();
    stroke(255, 0, 0, 150); // Rojo semitransparente
    strokeWeight(3);  
    
    
    
    float RectSide = random(1, 5);  // Solo valores 1, 2, 3 o 4

    // Convertimos el float a int para usar en el switch
    int side = int(RectSide);

    switch (side) {
      case 1:
        // Rectángulo inferior
        rect(xPos + offset, yPos + lado - offset - lado / 3, lado - offset - 3, lado / 3);
        daruma.x = xPos + lado / 2 - daruma.sizeX / 2;  
        daruma.y = yPos + lado - daruma.sizeY / 2 - 18;
        positionRect = PositionRect.ABAJO;
        break;

      case 2:
        // Rectángulo superior 
        rect(xPos + offset, yPos + offset, lado - 2 * offset, lado / 3);
        daruma.x = xPos + lado / 2 - daruma.sizeX / 2;
        daruma.y = yPos - daruma.sizeY; // Fuera del borde superior
        positionRect = PositionRect.ARRIBA;
        break;

      case 3:
        // Rectángulo derecho 
        rect(xPos + lado - lado / 3 - offset, yPos + offset, lado / 3, lado - 2 * offset);
        daruma.x = xPos + lado - daruma.sizeX / 2;
        daruma.y = yPos + lado / 2 - daruma.sizeY / 2;
        positionRect = PositionRect.DERECHA;
        break;

      case 4:
        // Rectángulo izquierdo
        rect(xPos + offset, yPos + offset, lado/3, lado - 2*offset);
        daruma.x = xPos - daruma.sizeX;  // Fuera del borde izquierdo (o xPos para pegarlo al borde)
        daruma.y = yPos + lado/2 - daruma.sizeY/2;  // Centrado 
        positionRect = PositionRect.IZQUIERDA ;

        break;
    }
  }

  // Lógica del salto
  if (estaSaltando) {
    if (!volviendo) {
      // Movimiento hacia el objetivo
      daruma.x = intlineal(daruma.x, xObjetivo, 0.2);
      daruma.y = intlineal(daruma.y, yObjetivo, 0.2);

      if (dist(daruma.x, daruma.y, xObjetivo, yObjetivo) < 1) {
        volviendo = true;
      }
    } else {
      // Movimiento de vuelta
      daruma.x = intlineal(daruma.x, xOriginal, 0.2);
      daruma.y = intlineal(daruma.y, yOriginal, 0.2);

      if (dist(daruma.x, daruma.y, xOriginal, yOriginal) < 1) {
        estaSaltando = false;
        volviendo = false;
      }
    }
  }

  // Dibujar el Daruma
  daruma.display();
  println("Posición Daruma - X:", daruma.x, "Y:", daruma.y, "Saltando:", estaSaltando);
}
