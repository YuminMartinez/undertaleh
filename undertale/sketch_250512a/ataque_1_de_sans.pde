

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
  
 img = loadImage("daruma.png");

// Tamaño del Daruma (ajustado al 50% del lado del cuadrado)
float darumaSize = lado * 0.5f;  
// Posición del Daruma (centrada en el cuadrado)
float darumaX = xPos + lado/2 - darumaSize/2;  // Centro X
float darumaY = yPos + lado/2 - darumaSize/2;  // Centro Y



// Dibuja el Daruma
image(img, darumaX, darumaY, width/29.33f,height/25.5f);  
  
}
