


class curva {
  // Atributos de la clase
  PVector[] puntos_de_ctrl;  // Array con los 4 puntos de control: P0, P1, P2, P3
  PVector[] coefs;           // Coeficientes del polinomio de Bézier: C0, C1, C2, C3
  color color_curva;         // Color de la curva (para dibujarla)

  // -----------------------
  // CONSTRUCTOR
  // -----------------------
  curva(PVector[] p, color c) {
    puntos_de_ctrl = new PVector[4];  // Reservamos espacio para los 4 puntos
    coefs = new PVector[4];           // Reservamos espacio para los 4 coeficientes

    for (int i = 0; i < 4; i++) {
      puntos_de_ctrl[i] = p[i];         // Guardamos los puntos de control
      coefs[i] = new PVector(0.0, 0.0); // Inicializamos los coeficientes a 0
    }

    color_curva = c;  // Guardamos el color de la curva
  }



  void calcular_coefs() {
    coefs[0].x = puntos_de_ctrl[0].x;
    coefs[0].y = puntos_de_ctrl[0].y;

    coefs[1].x = -3.0 * puntos_de_ctrl[0].x + 3.0 * puntos_de_ctrl[1].x;
    coefs[1].y = -3.0 * puntos_de_ctrl[0].y + 3.0 * puntos_de_ctrl[1].y;

    coefs[2].x = 3.0 * puntos_de_ctrl[0].x - 6.0 * puntos_de_ctrl[1].x + 3.0 * puntos_de_ctrl[2].x;
    coefs[2].y = 3.0 * puntos_de_ctrl[0].y - 6.0 * puntos_de_ctrl[1].y + 3.0 * puntos_de_ctrl[2].y;

    coefs[3].x = -1.0 * puntos_de_ctrl[0].x + 3.0 * puntos_de_ctrl[1].x
               - 3.0 * puntos_de_ctrl[2].x + puntos_de_ctrl[3].x;
    coefs[3].y = -1.0 * puntos_de_ctrl[0].y + 3.0 * puntos_de_ctrl[1].y
               - 3.0 * puntos_de_ctrl[2].y + puntos_de_ctrl[3].y;
  }
  
  
  
  
    void curva_de_katanas() {
    float x, y, dx, dy;
    float u;
    float paso = 0.05; // Espaciado entre huesos

    for (u = 0.0; u <= 1.0; u += paso) {
      // Posición
      x = coefs[0].x + coefs[1].x * u + coefs[2].x * u * u + coefs[3].x * u * u * u;
      y = coefs[0].y + coefs[1].y * u + coefs[2].y * u * u + coefs[3].y * u * u * u;

      // Derivada (tangente)
      dx = coefs[1].x + 2 * coefs[2].x * u + 3 * coefs[3].x * u * u;
      dy = coefs[1].y + 2 * coefs[2].y * u + 3 * coefs[3].y * u * u;
      float angulo = atan2(dy, dx);

      // Dibujo del hueso rotado en su punto
      pushMatrix();
      translate(x, y);
      rotate(angulo);
      imageMode(CENTER);
      image(katana, 0, 0,10,10);
      popMatrix();
      
      imageMode(CORNER);  // PARA NO AFECTAR TODO LO DEMAS 
    }
  }
}
