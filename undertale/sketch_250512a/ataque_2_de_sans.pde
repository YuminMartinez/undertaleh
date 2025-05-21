
PImage toriil;


void SecondAttack()
{
  gameControl = GameControl.CLICK_RATON;

  
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

 /* 
  
  // Rectángulo izquierdo 
rect(xPos + offset, yPos + offset, lado/3, lado - 2*offset);
daruma.x = xPos - daruma.sizeX;  // Fuera del borde izquierdo (o xPos para pegarlo al borde)
daruma.y = yPos + lado/2 - daruma.sizeY/2;  // Centrado 

*/


/*
// Rectángulo superior 
rect(xPos + offset, yPos + offset, lado - 2*offset, lado/3);
daruma.x =  xPos + lado/2 - daruma.sizeX/2 ;
daruma.y = yPos - daruma.sizeY; // fuera del borde superior


*/
/*

 //Rectángulo derecho 
rect(xPos + lado - lado/3 - offset, yPos + offset, lado/3, lado - 2*offset);
daruma.x =  xPos + lado - daruma.sizeX/2 ;
daruma.y =  yPos + lado/2 - daruma.sizeY/2; // fuera del borde superior


*/
  // rectangulo inferior
  rect (xPos+offset, yPos+ lado -offset - lado/3,lado - offset- 3, lado/3);
 
  daruma.x = xPos + lado/2 - daruma.sizeX/2;
    
  daruma.y = yPos + lado -daruma.sizeY/2;


  int numeroDeCuadrados = 6;

 ///!!!!! el random no incluye el ultimo numero lolaxooo)
 for ( int i = 0; i <= numeroDeCuadrados; i++)
 {
 
 /*   switch(i)
    {
     case 1:
     
      
    }
 */
 
 
}
}







//// RECTANGULOS PEQUEÑOS ORGANIZACION
