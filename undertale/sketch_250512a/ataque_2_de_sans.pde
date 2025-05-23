PImage toriil;
enum PositionRect { IZQUIERDA, DERECHA, ARRIBA, ABAJO }

// Variables de estado
boolean SecondStageActive = false;
boolean mostrarAdvertencia = false;
boolean mostrarAtaque = false;
int tiempoAdvertencia =500; // 800ms de advertencia
int tiempoAtaque = 500;    // 1500ms de ataque visible
int tiempoInicioAtaque = 0;
PositionRect posicionActual;
boolean colisionActiva = false;
int Duration2ndAttack = 0;
boolean SndFirstTime = true;


void SecondAttack() 
{
  if(SndFirstTime)
  {
    Duration2ndAttack = millis();
    SndFirstTime = false;
  }
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
    daruma.y = yPos-20 + lado - daruma.sizeY/2;
    daruma.rotation = 0;
    break;
  case ARRIBA:
    daruma.x = xPos + lado/2 - daruma.sizeX/2;
    daruma.y = yPos+45 - daruma.sizeY;
    daruma.rotation = PI;
    break;
  case DERECHA:
    daruma.x = xPos -20 + lado - daruma.sizeX/2;
    daruma.y = yPos + lado/2 - daruma.sizeY/2;
    daruma.rotation = -HALF_PI;
    break;
  case IZQUIERDA:
    daruma.x = (xPos +50) - daruma.sizeX;
    daruma.y = yPos + lado/2 - daruma.sizeY/2;
    daruma.rotation = HALF_PI;
    break;
}
    xOriginal = daruma.x;
    yOriginal = daruma.y;
    xObjetivo = centroX; 
    yObjetivo = centroY;
  }

  // Variables para posición del ataque
  float rectX = 0, rectY = 0, rectW = 0, rectH = 0;
  float rotation = 0;
  int offset = 5;
  float imgWidth = 0; 
  float imgHeight = 0;

  // Calcular posición  del rectangulo y tamaño de la imagen bsegún el lado
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
      colisionActiva = true;
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
      colisionActiva = false;
    }
  }
  
  
   if (colisionActiva && !estaSaltando ) {
      // Calculamos las coordenadas reales del Torii (sin rotación para simplificar)
      float toriiX = rectX;
      float toriiY = rectY;
      float toriiW = rectW;
      float toriiH = rectH;
      
      if (colisionDarumaTorii(toriiX, toriiY, toriiW, toriiH)) {
        // ¡Colisión detectada!
        println("¡Colisión con el Torii!");
        colisionActiva = false; // Evitar múltiples detecciones
       
        PJLife -= 5;
        
     
      }
    }
  
  

  // Lógica del salto
  if (estaSaltando) {
    manejarSalto();
  }

  // Dibujar el Daruma
  daruma.displayR();
}
float velocidadSalto = 0.3f;
void manejarSalto() {
  if (!volviendo) {
    // Movimiento hacia el centro usando intlineal
    daruma.x = intlineal(daruma.x, xObjetivo, velocidadSalto);
    daruma.y = intlineal(daruma.y, yObjetivo, velocidadSalto);

    // Verificación de llegada al centro
    if (calculateDistance(daruma.x, daruma.y, xObjetivo, yObjetivo) < 5) {
      volviendo = true;
     
    }
  } else {
    // Movimiento de regreso usando intlineal
    daruma.x = intlineal(daruma.x, xOriginal, velocidadSalto);
    daruma.y = intlineal(daruma.y, yOriginal, velocidadSalto);

    // Verificación de llegada al origen
    if (calculateDistance(daruma.x, daruma.y, xOriginal, yOriginal) < 5) {
      estaSaltando = false;
      volviendo = false;
   
    }
  }
}

   

boolean colisionDarumaTorii(float toriiX, float toriiY, float toriiW, float toriiH) {
    // Área de colisión del Daruma (ajustar según tus necesidades)
    float darumaLeft = daruma.x;
    float darumaRight = daruma.x + daruma.sizeX;
    float darumaTop = daruma.y;
    float darumaBottom = daruma.y + daruma.sizeY;
    
    // Área de colisión del Torii
    float toriiLeft = toriiX;
    float toriiRight = toriiX + toriiW;
    float toriiTop = toriiY;
    float toriiBottom = toriiY + toriiH;
    
    // Detectar superposición
    return darumaRight > toriiLeft && 
           darumaLeft < toriiRight && 
           darumaBottom > toriiTop && 
           darumaTop < toriiBottom;
}

void Reset2ndRound()
{
  SndFirstTime = true;
}
