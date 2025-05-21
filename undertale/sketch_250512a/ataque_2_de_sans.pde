
PImage toriil;

void SecondAttack()
{
toriil = loadImage("toriil.png");
  
image(toriil,width/2,height/2,100,100);
  
  

  noFill();
  stroke(255);  // Borde blanco estilo Undertale
  strokeWeight(3);  
  // Tamaño del cuadrado 
  float lado = width * 0.15f;  // 15% del ancho de pantalla (más proporcional) 

  // Posición X: 
  float xPos = (width/3 + width/2) / 2 - lado/2 + 180; // +100px a la derecha
  // Posición Y: 
  float yPos = height/2.2f; 
  rect(xPos, yPos, lado, lado);  
  
    daruma.limitarMovimiento(xPos, yPos, xPos +lado, yPos + lado);  

  
  
  daruma.display();
  
  
  
    noFill();
  stroke(255);  // Borde blanco estilo Undertale
  strokeWeight(3);  
  
   //rect(xPos,yPos,  lado/3 ,lado); // rect izquierda 
   
   rect(xPos,yPos,lado, lado/3); // arriba 
  
 // rect (xPos + lado - ,yPos,lado- 5,lado 5 );
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
 //ultimo corchete del second atackk 
}
