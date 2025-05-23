// Variables del 3r atauqe de Sans

int timeAttack = 0;
int Pilares = 5;
int PlayerDodge = 0;
int [] DisplayDodge = new int[Pilares];
float [] DodgePosX = new float[Pilares];
float [] SpawnDodgePosX = new float[Pilares];
boolean [] DodgeEnd = new boolean[Pilares];
boolean firstRound = true;

// Funcion que ejecuta el 3r ataque de Sans
void DodgeAttack()
{
  
 gameControl = GameControl.RATON;
  if(firstRound)
  {
    // Actuivamos el cronometro que nos parará el ataque a las 10 segundos
    timeAttack = millis();
  }
  stroke(255);  // Borde blanco estilo Undertale
  strokeWeight(5);  
  fill(0);
  // Tamaño del cuadrado 
  float lado = width * 0.15f;  

  // Posición X: 
  float xPos = (width/3 + width/2) / 2 - lado/2 + 180; 
  // Posición Y: 
  float yPos = height/2.2f; 
  rect(xPos, yPos, lado, lado);
  float DarumaY = 0;
  float DarumaX = xPos+lado*0.75f;
  // Segun la posicion del Jugador se moverá arriba o abajo
  switch(PlayerDodge)
  {
    case -1:
    DarumaY = yPos;
    break;
    case 0:
    DarumaY = yPos+lado*0.4f;
    break;
    case 1:
    DarumaY = yPos+lado*0.75f;
    break;
  }
  // Si el Daruma recibe daño, cambiará de color utilizando los Lutts
  if(LastPJLife > PJLife)
  {
    image(DarumaFeito, DarumaX, DarumaY, width/21.33f,height/13.5f);
  }
  else
  {
  image(img, DarumaX, DarumaY, width/21.33f,height/13.5f);
  }
  
  
  stroke(255);
  strokeWeight(5);
  noFill();
  if(firstRound == true)
  {
    // Inicializamos las posiciones de los obstaculos para que salgan en un orden
    SpawnDodgePosX[0] = xPos;
    SpawnDodgePosX[1] = xPos - 190;
    SpawnDodgePosX[2] = xPos - 250;
    SpawnDodgePosX[3] = xPos - 400; 
    SpawnDodgePosX[4] = xPos - 550; 
    DodgePosX[0] = SpawnDodgePosX[0];
    DodgePosX[1] = SpawnDodgePosX[1];
    DodgePosX[2] = SpawnDodgePosX[2];
    DodgePosX[3] = SpawnDodgePosX[3];
    DodgePosX[4] = SpawnDodgePosX[4];
  }
  for(int i = 0; i < Pilares; i++)
  {
    if(DodgeEnd[i] == true || firstRound == true)
    {
    DisplayDodge[i] = (int)random(-2,2);
    DodgeEnd[i] = false;
    
    }
    if(DodgePosX[i] >= xPos)
      {
        // Dependiendo del numero, aparecerán en un trayecto de la pantalla
        switch(DisplayDodge[i])
        {
           case -1:
            rect(DodgePosX[i], yPos,0, lado/3);
             break;
           case 0:
            rect(DodgePosX[i], yPos+lado/3,0, lado/3);
             break;
           case 1:
            rect(DodgePosX[i], yPos+(2*lado/3),0, lado/3);
             break;
        }
    }
    
  }
  // Si el obstaculo collisiona con el player, pierde vida
  LastPJLife = PJLife;
  firstRound = false;
  for(int i = 0; i < Pilares; i++ )
  {
    if(DisplayDodge[i] == PlayerDodge && (DodgePosX[i] >=DarumaX && DodgePosX[i] < (DarumaX+width/21.33f)))
    {
      PJLife--;
      
    }
    DodgePosX[i] += 15;
    //if(DisplayDodge[i])
    if(DodgePosX[i] >=xPos+lado)
    {
      DodgePosX[i] = SpawnDodgePosX[i];
      DodgeEnd[i] = true;
    }
  }
  
}
// Reseteamos las variables convenientes para que al repetir el ataque funcionen bien
void ResetAtt3()
{
  PlayerDodge = 0;
  for(int i = 0; i < Pilares; i++)
    {
    DodgeEnd[i] = false;
    }
  firstRound = true;
}
