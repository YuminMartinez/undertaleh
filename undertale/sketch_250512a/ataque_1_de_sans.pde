//variables
PImage darumaImg;
Daruma daruma;
 PImage katana;

curva curvaKatana;
curva curvaKatana2;
boolean moveAttackOne = false ;

boolean bezzerSuperado = false;
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
  
    daruma.limitarMovimiento(xPos, yPos, xPos +lado, yPos + lado); 
  daruma.display();
  
  if (bezzerSuperado == false){
  curvaKatana.curva_de_katanas();
  curvaKatana2.curva_de_katanas();
  }
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
   inicializarBolas(); 
}




//BOLASS


// BOLAS DE RECOLECTA
Bolas[] bolas = new Bolas[4];
PVector posicionA, posicionB; // Solo declaramos los objetos, sin inicializar aún
int bolaActual = 0;
boolean juegoActivo = true; // Controla si el sistema de bolas está activo






class Bolas extends Position {
  PImage imgSakura;  // Todos usan la misma imagen
  boolean visible;
  float tamano = 30; // Tamaño fijo para todas
  
  // Constructor
  Bolas(float x, float y) {
    super(x, y,3,3);
    this.imgSakura = loadImage("sakura.png"); // Carga la imagen aquí
    this.visible = true;
  }
  
  void display() {
    if (!visible) return;
    image(imgSakura, x, y, tamano, tamano); // Dibuja la flor
  }
  
  // Colisión con Daruma (igual que antes)
  boolean colisionaConDaruma(Daruma daruma) {
    if (!visible) return false;
    return (x < daruma.x + daruma.sizeX && 
            x + tamano > daruma.x && 
            y < daruma.y + daruma.sizeY && 
            y + tamano > daruma.y);
  }
}


void inicializarBolas() {
  int offsetVertical = -30;
  posicionA = new PVector(curvaKatana.puntos_de_ctrl[0].x, curvaKatana.puntos_de_ctrl[0].y + offsetVertical);
  posicionB = new PVector(curvaKatana.puntos_de_ctrl[3].x, curvaKatana.puntos_de_ctrl[3].y + offsetVertical);

  // Todas las bolas son flores de sakura
  bolas[0] = new Bolas(posicionA.x, posicionA.y);
  bolas[1] = new Bolas(posicionB.x, posicionB.y);
  bolas[2] = new Bolas(posicionA.x, posicionA.y);
  bolas[3] = new Bolas(posicionB.x, posicionB.y);
  
  // Solo la primera visible al inicio
  for (int i = 1; i < 4; i++) bolas[i].visible = false;
}

void verificarColisiones() {

  
  
  //colision con  bezier daruma :
  if (curvaKatana.colisionaConDaruma(daruma)&& bezzerSuperado == false||curvaKatana2.colisionaConDaruma(daruma )&& bezzerSuperado == false)
  {
  println("¡Colisión detectada con el Daruma!");
   PJLife--;
  /////////////////
  
 
  
  
//  ---------LUTSSSSS ------------
  
  
  
  ////// 
  
  }
  
  
  if (!juegoActivo)
  {
    
    bezzerSuperado = true;
    printShurikens();
  }// Si ya se recolectaron todas, no hacer nada
  
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



///// segunda fase

curba_interpolacion[] curvasShuriken = new curba_interpolacion[5];  // Array para 5 curvas
Shuriken shuriken;
PImage imgShuriken;

 
  
void inicializarCurvasShuriken() {
    // Cargar imagen y crear shuriken
  imgShuriken = loadImage("shuriken.png");
  shuriken = new Shuriken(curvasShuriken, "shuriken.png");
  
   float lado = width * 0.15f;  // 15% del ancho de pantalla (más proporcional) 

  // Posición X: 
  float xPos = (width/3 + width/2) / 2 - lado/2 + 180; // +100px a la derecha
  // Posición Y: 
  float yPos = height/2.2f; 
  // Crear 5 curvas con puntos de control aleatorios
  for (int i = 0; i < curvasShuriken.length; i++) {
    PVector[] puntos = new PVector[4];
    for (int j = 0; j < 4; j++) {
      
       // Generar puntos dentro del cuadrado de ataque
      float px = random(xPos, xPos + lado);
          float py = random(yPos, yPos + lado);
          puntos[j] = new PVector(px, py);
    }
    curvasShuriken[i] = new curba_interpolacion(puntos);
    curvasShuriken[i].calcular_coefs();
  }
}
  

void printShurikens()
{
 
    // Dibujar todas las curvas del shuriken
    for (int i = 0; i < curvasShuriken.length; i++) {
        curvasShuriken[i].pintar_curva();
        
        // Dibujar puntos de control (debug para saber si estan dentro del cuadrado)
        stroke(255, 0, 0);
        strokeWeight(8);
        
        
        for (int j = 0; j < curvasShuriken[i].puntos_de_ctrl.length; j++) {
            point(curvasShuriken[i].puntos_de_ctrl[j].x, curvasShuriken[i].puntos_de_ctrl[j].y);
            
            shuriken.actualizar();
            shuriken.dibujar();
          
        }
    } 
    
}
 
  
  
  
  
