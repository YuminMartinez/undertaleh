// Variables De Sans
int MaxvidaPNJ = 1000;
int vidaPNJ = MaxvidaPNJ;
int dmg = 1;
PImage Enemy;
boolean DañoMostrado = false; 
int tiempoDañoMostrado = 0;
int dañoDelJugador = 0;
PImage EnemyShuriken;
PImage SansDefeated;
float translateSans = 1;
float posXSansDefeated = 10;
float FinalposX;
boolean esc1 = false;
boolean Defeat = false;
boolean esc2 = false;
boolean bbCeniza = false;
// Funcion Para Printear un sprite o otro depeniendo del Ataque que se este realizando
void PrintEnemy()
{
  if (bezzerSuperado == false)
  {
  image(SpriteEnemy1, width/3, height/9,width/3,height/1.5f);
    if(DañoMostrado == false)
      {
        LutsSans();
      }
  }
  else if(bezzerSuperado == true)
  {
    image(EnemyShuriken, width/3, height/9,width/3,height/1.5f);
  }
  
  
}
// Funcion para printear la vida quitada por el Jugador a Sans
void PrintVidaPNJ()
{
  if (DañoMostrado) 
  {
    textSize(48);
    fill(255, 0, 0);
    text(dañoDelJugador, width/2, height/6);
    
    // Si han pasado más de 1000ms oculta el daño
    if (millis() - tiempoDañoMostrado > 1000) 
    {
      DañoMostrado = false;
    }
  
  fill(255,0,0);
  strokeWeight(0);
  rect(width/3.5f,height/24,width/3.5f, height/20);
  // Barra de vida verde que indica la vida que le queda al Enemigo
  fill(0,255,0);
  strokeWeight(0);
  rect(width/3.5f,height/24,vidaPNJ*(width/3.5f)/MaxvidaPNJ, height/20);
  }
}
// Funcion para restar la vida quitada a Sans
void PNJRecibirDaño(int dmg)
{
  // Resta vida a Sans cuando el Jugador ataca
  dañoDelJugador = dmg;
  vidaPNJ -= dmg;
  if(vidaPNJ < 0)
  {
     vidaPNJ = 0; 
  } 
  DañoMostrado = true;
  tiempoDañoMostrado = millis();
}
// Cuando el daño esta activado Sans se pone de color gris, demostrando que le hemos dado
void LutsSans()
{
  // Funcion de luts de classe para cambiar a grises
    for(int i=0;i<SpriteEnemy2.width;i++){ // Recorre columnas, osea en X
    for(int j=0;j<SpriteEnemy2.height;j++){ // Recorre filas, osea en Y
      // Ya estoy en el pixel i,j de la imagen
      // 1) Get de los valores RGB del pixel
      color pillo_el_color = SpriteEnemy2.get(i,j);
      // 2) Aplicar la formula, la LUT
      float r = red(pillo_el_color);
      float g = green(pillo_el_color);
      float b = blue(pillo_el_color);
      float y = 0.299*r+0.587*g+0.114*b; // Aplicar la formula
      color el_color_nuevo = color(y);
      // 3) Set de los nuevos valores al pixel
      SpriteEnemy1.set(i,j,el_color_nuevo);
    }
  }
  image(SpriteEnemy2,width/3, height/9,width/3,height/1.5f);

}
// Funcion para caundo el Jugador Gana a Sans
void GoodEnding()
{
  if(!Defeat)
  {
    if(translateSans < 1.15)
  {
  SoundTrack.pause();
  // Se hace un escalado  para hacer mas grande la imagen 
  pushMatrix();
  scale(translateSans);
  image(SansDefeated, width/3,height/9,width/3,height/1.5f);
 
  popMatrix();
  translateSans+= 0.002;
  
  }
  
  else if( width/2.5f-((width/3*translateSans)-posXSansDefeated) < width/8.5f)
  {
    // Transladamos hacha la izquierda para centrar la imagen
  pushMatrix();
  translate(-posXSansDefeated,0);
  image(SansDefeated, width/3*translateSans,height/9*translateSans,width/3*translateSans,height/1.5f*translateSans);
  posXSansDefeated+=2;
  FinalposX = width/3*translateSans -posXSansDefeated;
  popMatrix();
  }
  else
  {
    esc1 = true;
    Defeat = true;
    aparicion = 255;
  }
  }
  // Texto que te dice Sans antes de Desaparecer
  if(esc1)
  {
    image(SansDefeated, FinalposX,height/9*translateSans,width/3*translateSans,height/1.5f*translateSans);
    stroke(255);
    strokeWeight(5);
    fill(0);
    rect(width/6, height/1.4f,2*width/3, height/5);
    fill(255);
    textSize(48); 
      timeText = millis();
      String wordStats = "You have defeated me, how is it possible?";
      if(!ended)
      {
      if(CharNext < wordStats.length() && timeText - lastTime > vtext)
      {
        CharNext++;
        lastTime = timeText;
      }
      }
      textAlign(LEFT, LEFT);
    String Visible = wordStats.substring(0,CharNext);
    text(Visible, width/4.9f, height/1.3f);
    if(wordStats.length() == Visible.length())
    {
      ended = true;    
    }
  
  }
  
  if(!esc1 && esc2 )
  {
    // Desaparicion de Sans 
    tint(255,aparicion);
    image(SansDefeated, FinalposX,height/9*translateSans,width/3*translateSans,height/1.5f*translateSans);
    if(aparicion <= 0 )
     {
       // Texto de agradecimineto por haber completado el juego
      stroke(255);
      strokeWeight(5);
      fill(0);
      rect(width/6, height/1.4f,2*width/2.7f, height/5);
      fill(255);
      textSize(48); 
      textAlign(LEFT, LEFT);
      text("Thanks for playing our Undertale recreation, we hope you liked it.", width/4.9f, height/1.3f);
        aparicion = 0; 
     }
     else
     {
       aparicion -= 5;
     }
     if(aparicion <100 && bbCeniza == false)
     {
       BebeCeniza.play();
       bbCeniza = true;
     }
  }
  
  
  
   
}
