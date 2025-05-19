void firstStage() {
  // Rectángulo principal
  float anchoPrincipal = 950;
  float altoPrincipal = 400;
  float posXPrincipal = (width - anchoPrincipal) / 2;
  float posYPrincipal = (height / 2) - (altoPrincipal / 2) + 100;

  drawRectWithText(posXPrincipal, posYPrincipal, anchoPrincipal, altoPrincipal,    "BATTLE AGAINST SANS Feudal\n - UNDERTALE HOMAGE -",  40  );

  // Texto de "PRESS SPACE TO START"
  fill(255); 
  textSize(40);
  textAlign(CENTER, CENTER);
  text("PRESS SPACE TO START", width / 2, posYPrincipal + altoPrincipal - 50);

  // Rectángulos pequeños (horizontal)
  pushMatrix();
  translate(width/2 - 475, height/2 + 350); // Posición debajo del principal
  drawRectWithText(0, 0, 450, 150, "Yumin Martinez", 30);
  translate(500, 0); // Desplazamiento horizontal para el segundo
  drawRectWithText(0, 0, 450, 150, "Edgard Hernandez", 30);
  popMatrix();
}

void drawRectWithText(float x, float y, float w, float h, String txt, float textSize) {
  noFill();
  stroke(255);
  strokeWeight(5);
  rect(x, y, w, h);
  
  fill(255);
  textSize(textSize);
  textAlign(CENTER, CENTER);
  text(txt, x + w / 2, y + h / 2);
}
