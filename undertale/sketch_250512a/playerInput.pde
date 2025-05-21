boolean estaSaltando = false;
boolean volviendo = false;

float xOriginal, yOriginal;
float xObjetivo, yObjetivo;

float velocidad = 5;  // velocidad de salto (ajustable)

void mousePressed() {
  if (!estaSaltando) {
    estaSaltando = true;
    volviendo = false;

    xOriginal = daruma.x;
    yOriginal = daruma.y;

    float distanciaSalto = 40;  // puedes ajustar este valor

    switch (positionRect) {
      case IZQUIERDA:
        xObjetivo = daruma.x + distanciaSalto;
        yObjetivo = daruma.y;
        break;

      case DERECHA:
        xObjetivo = daruma.x - distanciaSalto;
        yObjetivo = daruma.y;
        break;

      case ARRIBA:
        xObjetivo = daruma.x;
        yObjetivo = daruma.y + distanciaSalto;
        break;

      case ABAJO:
        xObjetivo = daruma.x;
        yObjetivo = daruma.y - distanciaSalto;
        break;
    }
  }
}


void keyPressed() 
{
  if(keyCode == 'Q')
  {
    PJLife--;
  }
  if(keyCode == 'E')
  {
    PJLife++;
  }
  if (key == ' ' || keyCode == 32) 
  {  // Si se presiona la barra espaciadora
    if (gameState == GameState.FIRST_STAGE) 
    {
      gameState = GameState.TRANSITION;
        transitionX = 0;// Cambia al segundo estado
    }
  }
  
   if(actionSelected == true )
    {
      if(keyCode == SHIFT)
      {
        actionSelected = false;
        MenuBattle = true;
      }
      if(keyCode == ENTER)
       {
         actionSelected = false;
         atackMode = true;
       }
    }
    if(MenuBattle == true)
    {
       if (keyCode == LEFT) 
       {  // Si se presiona la tecla izquierda
           player_choose--;
           if(player_choose <0)
             player_choose = 0;
       }
       if (keyCode == RIGHT) 
       {  // Si se presiona la tecla derecha
           player_choose++;
           if(player_choose >3)
            { player_choose = 3;
            }
       }
       if(keyCode == ENTER)
       {
         switch(player_choose)
         {
          case 0:
            MenuBattle = false;
            actionSelected = true;
            break;
         }
       }
       

    }
   
   
}
