//

boolean moveAttackOne = false ;

void attackone() {
  //CUADRADO
  
  moveAttackOne = true;
  noFill();
  stroke(255);  // Borde blanco estilo Undertale
  strokeWeight(3);  // Más grueso para que se vea épico
  // Tamaño del cuadrado 
  float lado = width * 0.15f;  // 15% del ancho de pantalla (más proporcional) 

  // Posición X: 
  float xPos = (width/3 + width/2) / 2 - lado/2 + 180; // +100px a la derecha
  // Posición Y: 
  float yPos = height/2.2f; 
  rect(xPos, yPos, lado, lado);  
  
  
  daruma.display();
  curvaKatana.curva_de_katanas();
  curvaKatana2.curva_de_katanas();
}

//bezzier
void katanas_iniciar() {
  katana = loadImage("katana.jpg");
  float lado = width * 0.15f;
  float xPos = (width/3 + width/2) / 2 - lado/2 + 180;
  float yPos = height / 2.2f;

  // Puntos de control (P0 y P3 fijos, P1 y P2 móviles)
  PVector[] p = new PVector[4];
  p[0] = new PVector(xPos + lado * 0.1, yPos + lado * 0.4 + 70); // P0 fijo
  p[1] = new PVector(xPos + lado * 0.3, yPos + lado * 0.1 + 70); // P1 móvil
  p[2] = new PVector(xPos + lado * 0.7, yPos + lado * 0.7 + 70); // P2 móvil
  p[3] = new PVector(xPos + lado * 0.9, yPos + lado * 0.5 + 70); // P3 fijo

  curvaKatana = new curva(p, color(255, 255, 0));
  curvaKatana.calcular_coefs();

  // Curva superior (similar)
  PVector[] p2 = new PVector[4];
  p2[0] = new PVector(xPos + lado * 0.1, yPos + lado * 0.4 + 5); // P0 fijo
  p2[1] = new PVector(xPos + lado * 0.3, yPos + lado * 0.1 + 5); // P1 móvil
  p2[2] = new PVector(xPos + lado * 0.7, yPos + lado * 0.7 + 5); // P2 móvil
  p2[3] = new PVector(xPos + lado * 0.9, yPos + lado * 0.5 + 5); // P3 fijo

  curvaKatana2 = new curva(p2, color(0, 255, 255));
  curvaKatana2.calcular_coefs();
}
