 class curba_interpolacion {
  PVector[] puntos_de_ctrl;
  PVector[] coefs;

  curba_interpolacion(PVector[] p) {
    puntos_de_ctrl = new PVector[4];
    coefs = new PVector[4];
    for (int i = 0; i < 4; i++) {
      puntos_de_ctrl[i] = new PVector(p[i].x, p[i].y);
      coefs[i] = new PVector(0.0, 0.0);
    }
  }

  void calcular_coefs() {
    coefs[0].x = puntos_de_ctrl[0].x;
    coefs[0].y = puntos_de_ctrl[0].y;
    coefs[1].x = -5.5*puntos_de_ctrl[0].x + 9.0*puntos_de_ctrl[1].x - 4.5*puntos_de_ctrl[2].x + puntos_de_ctrl[3].x;
    coefs[1].y = -5.5*puntos_de_ctrl[0].y + 9.0*puntos_de_ctrl[1].y - 4.5*puntos_de_ctrl[2].y + puntos_de_ctrl[3].y;
    coefs[2].x = 9.0*puntos_de_ctrl[0].x - 22.5*puntos_de_ctrl[1].x + 18.0*puntos_de_ctrl[2].x - 4.5*puntos_de_ctrl[3].x;
    coefs[2].y = 9.0*puntos_de_ctrl[0].y - 22.5*puntos_de_ctrl[1].y + 18.0*puntos_de_ctrl[2].y - 4.5*puntos_de_ctrl[3].y;
    coefs[3].x = -4.5*puntos_de_ctrl[0].x + 13.5*puntos_de_ctrl[1].x - 13.5*puntos_de_ctrl[2].x + 4.5*puntos_de_ctrl[3].x;
    coefs[3].y = -4.5*puntos_de_ctrl[0].y + 13.5*puntos_de_ctrl[1].y - 13.5*puntos_de_ctrl[2].y + 4.5*puntos_de_ctrl[3].y;
  }

  void pintar_curva() {
    float x, y;
    stroke(255, 255, 0);
    strokeWeight(2);
    for (float u = 0.0; u < 1.0; u += 0.01) {
      x = coefs[0].x + coefs[1].x * u + coefs[2].x * u * u + coefs[3].x * u * u * u;
      y = coefs[0].y + coefs[1].y * u + coefs[2].y * u * u + coefs[3].y * u * u * u;
      point(x, y);
    }
  }
}






class Shuriken {
  PImage img;
  PVector posicion;
  float velocidad;
  int curvaActual;
  float parametroU;
  curba_interpolacion[] curvas;
  float angulo;
  float escala;
  
  Shuriken(curba_interpolacion[] curvas, String imagenPath) {
    this.curvas = curvas;
    img = loadImage(imagenPath);
    posicion = new PVector();
    velocidad = 0.05;
    curvaActual = 0;
    parametroU = 0;
    angulo = 0;
    escala = 0.05; 
  }
  
  void actualizar() {
    // Calcular posición en la curva actual
    curba_interpolacion curva = curvas[curvaActual];
    posicion.x = curva.coefs[0].x + curva.coefs[1].x * parametroU +
                 curva.coefs[2].x * parametroU * parametroU +
                 curva.coefs[3].x * parametroU * parametroU * parametroU;
                 
    posicion.y = curva.coefs[0].y + curva.coefs[1].y * parametroU +
                 curva.coefs[2].y * parametroU * parametroU +
                 curva.coefs[3].y * parametroU * parametroU * parametroU;
    
    // Calcular dirección para la rotación (derivada de la posición)
    float dx = curva.coefs[1].x + 2 * curva.coefs[2].x * parametroU +
               3 * curva.coefs[3].x * parametroU * parametroU;
    float dy = curva.coefs[1].y + 2 * curva.coefs[2].y * parametroU +
               3 * curva.coefs[3].y * parametroU * parametroU;
    angulo = atan2(dy, dx);
    
    // Avanzar el parámetro
    parametroU += velocidad;
    
    // Cambiar a la siguiente curva cuando se complete la actual
    if (parametroU >= 1.0) {
      parametroU = 0;
      curvaActual = (curvaActual + 1) % curvas.length;
    }
  }
  
void dibujar() {
    pushMatrix(); // Guarda el estado actual de transformación
    
    // Aplicamos transformaciones solo al shuriken
    translate(posicion.x, posicion.y);  // Movemos al punto deseado
    rotate(angulo + PI/2);             // Rotamos (ajustando con PI/2 si es necesario)
    scale(escala);                     // Escalamos
    
    // Dibujamos el shuriken centrado en (0,0) después de las transformaciones
    imageMode(CENTER);
    image(img, 0, 0);  // Dibuja la imagen en el nuevo origen (centro)
    
    popMatrix(); // Restaura el estado anterior (ignora translate/rotate/scale)
    
    imageMode(CORNER); //PARA VOLVER  A DIBUJAR LAS IMAGENES EN EL CORNER
}


boolean colisionaConDaruma(Daruma daruma) {
        // Calcula el radio aproximado del shuriken 
        float radioShuriken = img.width * escala / 2;
        
        // Calcula el centro del shuriken
        float centroX = posicion.x;
        float centroY = posicion.y;
        
        // Calcula el centro del Daruma
        float centroDarumaX = daruma.x + daruma.sizeX/2;
        float centroDarumaY = daruma.y + daruma.sizeY/2;
        
        // Calcula la distancia entre centros
        float distancia = calculateDistance(centroX, centroY, centroDarumaX, centroDarumaY);
        
        // Radio aproximado del Daruma
        float radioDaruma = daruma.sizeX/2;
        
        // Hay colisión si la distancia es menor que la suma de radios
        return distancia < (radioShuriken + radioDaruma);
    }



}
