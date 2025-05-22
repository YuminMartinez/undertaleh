
PImage toriil;
enum PositionRect { IZQUIERDA, DERECHA, ARRIBA, ABAJO}

boolean SecondStageActive = false;


PositionRect positionRect;

void SecondAttack() {
  SecondStageActive = true;
  gameControl = GameControl.CLICK_RATON;

  // Dibujar fondo y elementos estáticos
  image(toriil, width/2, height/2, 100, 100);

  // Dibujar el cuadrado de ataque
  noFill();
  stroke(255);  // Borde blanco estilo Undertale
  strokeWeight(3);  
  float lado = width * 0.15f;  // Tamaño del cuadrado
  float xPos = (width/3 + width/2) / 2 - lado/2 + 180;
  float yPos = height/2.2f; 
  rect(xPos, yPos, lado, lado);  

  // Solo limitar movimiento si NO está saltando
  if (!estaSaltando) {
    daruma.limitarMovimiento(xPos, yPos, xPos + lado, yPos + lado);
    
    // Posición inicial del Daruma (ajusta según tu lógica)
    int offset = 5;
    noFill();
    stroke(255, 0, 0, 150); // Rojo semitransparente
    strokeWeight(3);  
    
      // rectangulo inferior
  rect (xPos+offset, yPos+ lado -offset - lado/3,lado - offset- 3, lado/3);
 
  daruma.x = xPos + lado/2 - daruma.sizeX/2;
    
  daruma.y = yPos + lado -daruma.sizeY/2;
positionRect = PositionRect.ABAJO ;
  }

  // Lógica del salto (sin cambios)
  if (estaSaltando) {
    if (!volviendo) {
      // Movimiento hacia el objetivo
      daruma.x = lerp(daruma.x, xObjetivo, 0.2);
      daruma.y = lerp(daruma.y, yObjetivo, 0.2);

      if (dist(daruma.x, daruma.y, xObjetivo, yObjetivo) < 1) {
        volviendo = true;
      }
    } else {
      // Movimiento de vuelta
      daruma.x = lerp(daruma.x, xOriginal, 0.2);
      daruma.y = lerp(daruma.y, yOriginal, 0.2);

      if (dist(daruma.x, daruma.y, xOriginal, yOriginal) < 1) {
        estaSaltando = false;
        volviendo = false;
      }
    }
  }

  // Dibujar el Daruma (¡importante que esté al final!)
  daruma.display();
  println("Posición Daruma - X:", daruma.x, "Y:", daruma.y, "Saltando:", estaSaltando);
}
