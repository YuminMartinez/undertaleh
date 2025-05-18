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
void katanas_iniciar(){
  
      //bezier
      
     
    //curva inferior
 katana = loadImage("katana.jpg"); 
// Coordenadas y tamaño del cuadrado
float lado = width * 0.15f;  // 15% del ancho de la pantalla
float xPos = (width/3 + width/2) / 2 - lado/2 + 180;
float yPos = height / 2.2f;


float offsetY = 70;
// Puntos de control para la curva dentro del cuadrado
PVector[] p = new PVector[4];
p[0] = new PVector(xPos + lado * 0.1, yPos + lado * 0.4 + offsetY);
p[1] = new PVector(xPos + lado * 0.3, yPos + lado * 0.1 + offsetY);
p[2] = new PVector(xPos + lado * 0.7, yPos + lado * 0.7 + offsetY);
p[3] = new PVector(xPos + lado * 0.9, yPos + lado * 0.5 + offsetY);

// Crear curva y calcular coeficientes
curvaKatana = new curva(p, color(255, 255, 0));
curvaKatana.calcular_coefs();


    //curva superior
    
float offset2Y = 5;
// Puntos de control para la curva dentro del cuadrado
PVector[] p2 = new PVector[4];
p2[0] = new PVector(xPos + lado * 0.1, yPos + lado * 0.4 + offset2Y);
p2[1] = new PVector(xPos + lado * 0.3, yPos + lado * 0.1 + offset2Y);
p2[2] = new PVector(xPos + lado * 0.7, yPos + lado * 0.7 + offset2Y);
p2[3] = new PVector(xPos + lado * 0.9, yPos + lado * 0.5 + offset2Y);
curvaKatana2 = new curva(p2, color(0, 255, 255)); 
curvaKatana2.calcular_coefs();
}
