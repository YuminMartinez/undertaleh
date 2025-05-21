  
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
