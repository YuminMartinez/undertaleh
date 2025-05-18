//variables
PImage darumaImg;
Daruma daruma;
 PImage katana;

curva curvaKatana;
curva curvaKatana2;
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




//BOLASS


// BOLAS DE RECOLECTA
Bolas[] bolas = new Bolas[4];
PVector posicionA = new PVector(300, 400);
PVector posicionB = new PVector(800, 300);
int bolaActual = 0;
boolean juegoActivo = true; // Controla si el sistema de bolas está activo






class Bolas extends Position {
  float radio;
  color colorBola;
  boolean visible;  // Controla si la bola debe mostrarse
  
  // Constructor
  Bolas(float x, float y, float radio, color c) {
    super(x, y, radio*2, radio*2);
    this.radio = radio;
    this.colorBola = c;
    this.visible = true;  // Por defecto visible
  }
  
  void display() {
    if (!visible) return;  // No dibujar si no es visible
    
    fill(colorBola);
    noStroke();
    ellipse(x, y, radio*2, radio*2);
  }
  
  // Verifica colisión con Daruma
  boolean colisionaConDaruma(Daruma daruma) {
    if (!visible) return false;  // Si ya no es visible, no colisiona
    
    // Calcula distancia entre centros
    float distancia = calculateDistance(x, y, daruma.x + daruma.sizeX/2, daruma.y + daruma.sizeY/2);
    return (distancia < radio + daruma.sizeX/2);
  }
}


void inicializarBolas() {
  

  // Inicializar las 4 bolas (todas invisibles al inicio)
  // Bolas 1 y 3 en posición A
  bolas[0] = new Bolas(posicionA.x, posicionA.y, 50, color(255, 0, 0)); 
  bolas[2] = new Bolas(posicionA.x, posicionA.y, 50, color(0, 255, 0));
  
  // Bolas 2 y 4 en posición B
  bolas[1] = new Bolas(posicionB.x, posicionB.y, 50, color(0, 0, 255));
  bolas[3] = new Bolas(posicionB.x, posicionB.y, 50, color(255, 255, 0));
  
  // Mostrar solo la primera bola
  for (int i = 1; i < 4; i++) bolas[i].visible = false;
}


void verificarColisiones() {
  if (!juegoActivo) return; // Si ya se recolectaron todas, no hacer nada
  
  if (bolas[bolaActual].colisionaConDaruma(daruma)) {
    bolas[bolaActual].visible = false;
    
    if (bolaActual < 3) { // Si no es la última bola
      bolaActual++;
      bolas[bolaActual].visible = true;
    } else { // Si es la 4ta bola
      juegoActivo = false;
      println("¡TODAS LAS BOLAS RECOLECTADAS!");
    }
  }
}
