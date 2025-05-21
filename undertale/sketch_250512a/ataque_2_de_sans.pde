
PImage toriil;
 
 int numeroDeCuadrados = 6;
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
  
  int offset = 5;
  
    noFill();
   stroke(255, 0, 0, 150); // Rojo semitransparente  // Borde blanco estilo Undertale
  strokeWeight(3);  
  
  // Rectángulo izquierdo 
rect(xPos + offset, yPos + offset, lado/3, lado - 2*offset);

// Rectángulo superior 
rect(xPos + offset, yPos + offset, lado - 2*offset, lado/3);

// Rectángulo derecho 
rect(xPos + lado - lado/3 - offset, yPos + offset, lado/3, lado - 2*offset);
  // rectangulo inferior
  rect (xPos+offset, yPos+ lado -offset - lado/3,lado - offset- 3, lado/3);
    
  
 //ultimo corchete del second atackk 
 

 ///!!!!! el random no incluye el ultimo numero lolaxooo)
 for ( int i = 0; i <= numeroDeCuadrado; i++)
 {
 
 /*   switch(i)
    {
     case 1:
     
      
    }
 */
 
 
}
