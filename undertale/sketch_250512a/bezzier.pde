class curva {
  PVector[] puntos_de_ctrl;
  PVector[] coefs;
  color color_curva;
  float tiempo = 0; // Variable para controlar el movimiento

  curva(PVector[] p, color c) {
    puntos_de_ctrl = new PVector[4];
    coefs = new PVector[4];
    for (int i = 0; i < 4; i++) {
      puntos_de_ctrl[i] = p[i];
      coefs[i] = new PVector(0.0, 0.0);
    }
    color_curva = c;
  }

  void actualizar_puntos_intermedios() {
    tiempo += 0.05; // Incrementa el tiempo para el movimiento
    float amplitud = 50; // Amplitud del movimiento
    float frecuencia = 0.5; // Frecuencia del movimiento

    // Mover P1 y P2 usando funciones de onda
    puntos_de_ctrl[1].x = puntos_de_ctrl[0].x + amplitud * sin(tiempo * frecuencia);
    puntos_de_ctrl[1].y = puntos_de_ctrl[0].y + amplitud * cos(tiempo * frecuencia);

    puntos_de_ctrl[2].x = puntos_de_ctrl[3].x + amplitud * sin(tiempo * frecuencia + PI);
    puntos_de_ctrl[2].y = puntos_de_ctrl[3].y + amplitud * cos(tiempo * frecuencia + PI);

    // Recalcular coeficientes después de mover los puntos
    calcular_coefs();
  }

  void calcular_coefs() {
    // Cálculo de los coeficientes (igual que antes)
    coefs[0].x = puntos_de_ctrl[0].x;
    coefs[0].y = puntos_de_ctrl[0].y;

    coefs[1].x = -3.0 * puntos_de_ctrl[0].x + 3.0 * puntos_de_ctrl[1].x;
    coefs[1].y = -3.0 * puntos_de_ctrl[0].y + 3.0 * puntos_de_ctrl[1].y;

    coefs[2].x = 3.0 * puntos_de_ctrl[0].x - 6.0 * puntos_de_ctrl[1].x + 3.0 * puntos_de_ctrl[2].x;
    coefs[2].y = 3.0 * puntos_de_ctrl[0].y - 6.0 * puntos_de_ctrl[1].y + 3.0 * puntos_de_ctrl[2].y;

    coefs[3].x = -1.0 * puntos_de_ctrl[0].x + 3.0 * puntos_de_ctrl[1].x - 3.0 * puntos_de_ctrl[2].x + puntos_de_ctrl[3].x;
    coefs[3].y = -1.0 * puntos_de_ctrl[0].y + 3.0 * puntos_de_ctrl[1].y - 3.0 * puntos_de_ctrl[2].y + puntos_de_ctrl[3].y;
  }

  void curva_de_katanas() {
    actualizar_puntos_intermedios(); // Actualiza los puntos intermedios antes de dibujar
    float x, y, dx, dy;
    float u;
    float paso = 0.05;

    for (u = 0.0; u <= 1.0; u += paso) {
      x = coefs[0].x + coefs[1].x * u + coefs[2].x * u * u + coefs[3].x * u * u * u;
      y = coefs[0].y + coefs[1].y * u + coefs[2].y * u * u + coefs[3].y * u * u * u;

      dx = coefs[1].x + 2 * coefs[2].x * u + 3 * coefs[3].x * u * u;
      dy = coefs[1].y + 2 * coefs[2].y * u + 3 * coefs[3].y * u * u;
      float angulo = atan2(dy, dx);

      pushMatrix();
      translate(x, y);
      rotate(angulo);
      imageMode(CENTER);
      image(katana, 0, 0, 10, 10);
      popMatrix();
    }
    imageMode(CORNER);
  }
}
