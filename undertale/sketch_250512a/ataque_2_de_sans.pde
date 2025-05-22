PImage toriil;
enum PositionRect { IZQUIERDA, DERECHA, ARRIBA, ABAJO }

// Variables de estado
boolean SecondStageActive = false;
boolean mostrarAdvertencia = false;
boolean mostrarAtaque = false;
int tiempoAdvertencia = 600; // 800ms de advertencia
int tiempoAtaque = 1500;    // 1500ms de ataque visible
int tiempoInicioAtaque = 0;
PositionRect posicionActual;


void SecondAttack() {
  SecondStageActive = true;
  gameControl = GameControl.CLICK_RATON;

  // Dibujar cuadrado de ataque principal (blanco)
  noFill();
  stroke(255);
  strokeWeight(3);
  float lado = width * 0.15f;
  float xPos = (width / 3 + width / 2) / 2 - lado / 2 + 180;
  float yPos = height / 2.2f;
  rect(xPos, yPos, lado, lado);

  // Definir posición central (objetivo del salto)
  float centroX = xPos + lado/2;
  float centroY = yPos + lado/2;

  // Lógica de temporización del ataque
  if (!mostrarAdvertencia && !mostrarAtaque) {
    // Iniciar nuevo ataque
    posicionActual = PositionRect.values()[(int)random(0, 4)];
    mostrarAdvertencia = true;
    tiempoInicioAtaque = millis();
    
    // Posición inicial del Daruma según el ataque
    switch(posicionActual) {
      case ABAJO:
        daruma.x = xPos + lado/2 - daruma.sizeX/2;
        daruma.y = yPos + lado - daruma.sizeY/2;
        break;
      case ARRIBA:
        daruma.x = xPos + lado/2 - daruma.sizeX/2;
        daruma.y = yPos - daruma.sizeY;
        break;
      case DERECHA:
        daruma.x = xPos + lado - daruma.sizeX/2;
        daruma.y = yPos + lado/2 - daruma.sizeY/2;
        break;
      case IZQUIERDA:
        daruma.x = xPos - daruma.sizeX;
        daruma.y = yPos + lado/2 - daruma.sizeY/2;
        break;
    }
    xOriginal = daruma.x;
    yOriginal = daruma.y;
    xObjetivo = centroX; // El salto va al centro
    yObjetivo = centroY;
  }

  // Variables para posición del ataque
  float rectX = 0, rectY = 0, rectW = 0, rectH = 0;
  float rotation = 0;
  int offset = 5;
  float imgWidth = 0; 
  float imgHeight = 0;

  // Calcular posición según el lado
  switch(posicionActual) {
    case ABAJO:
      rectW = lado - offset - 3;
      rectH = lado / 3;
      rectX = xPos + offset;
      rectY = yPos + lado - offset - rectH;
      rotation = 0;
      imgWidth = rectW; 
      imgHeight = rectH;
      break;
      
    case ARRIBA:
      rectW = lado - 2 * offset;
      rectH = lado / 3;
      rectX = xPos + offset;
      rectY = yPos + offset;
      rotation = PI;
      imgWidth = rectW; 
      imgHeight = rectH;
      break;
      
    case DERECHA:
      rectW = lado / 3;
      rectH = lado - 2 * offset;
      rectX = xPos + lado - rectW - offset;
      rectY = yPos + offset;
      rotation = -HALF_PI;
      imgWidth = rectH; 
      imgHeight = rectW;
      break;
      
    case IZQUIERDA:
      rectW = lado / 3;
      rectH = lado - 2 * offset;
      rectX = xPos + offset;
      rectY = yPos + offset;
      rotation = HALF_PI;
      imgWidth = rectH; 
      imgHeight = rectW;
      break;
  }

  // Mostrar advertencia (rectángulo rojo)
  if (mostrarAdvertencia) {
    noFill();
    stroke(255, 0, 0, 150);
    strokeWeight(3);
    rect(rectX, rectY, rectW, rectH);

    // Transición al ataque real después del tiempo de advertencia
    if (millis() - tiempoInicioAtaque > tiempoAdvertencia) {
      mostrarAdvertencia = false;
      mostrarAtaque = true;
      tiempoInicioAtaque = millis();
    }
  }

  // Mostrar ataque real (Torii)
  if (mostrarAtaque) {
    pushMatrix();
    translate(rectX + rectW/2, rectY + rectH/2);
    rotate(rotation);
    imageMode(CENTER);
    image(toriil, 0, 0, imgWidth, imgHeight);
    popMatrix();
    imageMode(CORNER);

    // Finalizar ataque después del tiempo establecido
    if (millis() - tiempoInicioAtaque > tiempoAtaque) {
      mostrarAtaque = false;
    }
  }

  // Lógica del salto
  if (estaSaltando) {
    manejarSalto();
  }

  // Dibujar el Daruma
  daruma.display();
}

void manejarSalto() {
  if (!volviendo) {
    daruma.x = lerp(daruma.x, xObjetivo, 0.1);
    daruma.y = lerp(daruma.y, yObjetivo, 0.1);

    if (dist(daruma.x, daruma.y, xObjetivo, yObjetivo) < 5) {
      volviendo = true;
    }
  } else {
    daruma.x = lerp(daruma.x, xOriginal, 0.1);
    daruma.y = lerp(daruma.y, yOriginal, 0.1);

    if (dist(daruma.x, daruma.y, xOriginal, yOriginal) < 5) {
      estaSaltando = false;
      volviendo = false;
    }
  }
}
