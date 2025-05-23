boolean estaSaltando = false;
boolean volviendo = false;

float xOriginal, yOriginal;
float xObjetivo, yObjetivo;

float velocidad = 5;  // velocidad de salto (ajustable)

boolean verCurvaInter = false;


void mousePressed() {
  if(SecondStageActive == true)
{
  if (!estaSaltando ) {
    gameControl = GameControl.CLICK_RATON; // Fuerza el modo CLICK_RATON
    estaSaltando = true;
    volviendo = false;
    xOriginal = daruma.x;
    yOriginal = daruma.y;
    float distanciaSalto = 200;  // Ajusta según necesidad

    switch (posicionActual) {
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
  
  if(keyCode == 'ñ')
  {
    verCurvaInter = !verCurvaInter;
  }
  
  if(ReallyMercy)
  {
    if(keyCode == ENTER && Mercytext2)
    {
      CharNext = 0;
      ended = false;
      Mercytext2 = false;
      ReallyMercy = false;
      ChangeToMain = true;
       timeTransition = millis();
    }
    if(keyCode == ENTER && Mercytext1)
    {
      Mercytext1 = false;
      CharNext = 0;
      ended = false;
      Mercytext2 = true;
    }
  }
  if(EatFood)
  {
    if(keyCode == ENTER)
    {
      EatFood = false;
      Eated = false;
      ChangeToMain = true;
      CharNext = 0;
      ended = false;
       timeTransition = millis();
    }
  }
  if(lunchTime)
  {
    if(keyCode == ENTER)
    {
      lunchTime = false;
      EatFood = true;
    }
    if(keyCode == SHIFT)
    {
      lunchTime = false;
      MenuBattle = true;
    }
  }
  if(FindObject)
  {
    if(keyCode == ENTER)
    {
      FindObject = false;
      ChangeToMain = true;
      ended = false;
      firstSearch = false;
      CharNext = 0;
      if(possibility == 4)
      {
       WeaponFinded = true; 
      }
       timeTransition = millis();
    }
  }
  if(CheckEnemy == true)
  {
    if(keyCode == ENTER && Checktext2 ) 
       {
         
         Checktext2 = false;
         CheckEnemy = false;
         ChangeToMain = true; 
         ended = false;
         CharNext = 0;
         timeTransition = millis();
         
       }
    if(keyCode == ENTER && Checktext1)
    {
      Checktext1 = false;
      Checktext2 = true;
      ended = false;
      CharNext = 0;
    }
  }
  
  if(ActMode == true)
  {
   if(keyCode == SHIFT)
      {
        ActMode = false;
        MenuBattle = true;
      }
    if (keyCode == UP) 
       {  
           ActSelection--;
           
           if(ActSelection <0)
             ActSelection = 0;
       }
     if (keyCode == DOWN) 
       {  
           ActSelection++;
           if(ActSelection >1)
            { ActSelection = 1;
            }
       }
     if(keyCode == ENTER) 
       {
         switch(ActSelection)
         {
           case 0:
               ActMode = false;
               CheckEnemy = true;
               Checktext1 = true;
             break;
           case 1:
             ActMode = false;
             FindObject = true;
             break;
         }
       }
  }
  if( atackMode == true)
  {
     if(keyCode == ENTER) 
     {
       atackMode = false;
       AtaqueRealizado = true;
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
         case 1:
           MenuBattle = false;
           ActMode = true;
           break;
         case 2:
           MenuBattle = false;
           lunchTime = true;
           break;
         case 3:
           MenuBattle = false;
           ReallyMercy = true;   
           Mercytext1 = true;
         }
            
       }
       

    }
   
   if(TrAttack == true)
   {
     if(keyCode == DOWN)
     {
       PlayerDodge++;
       if(PlayerDodge >1)
       {
         PlayerDodge = 1;
       }
     }
     if(keyCode == UP)
     {
       PlayerDodge--;
       if(PlayerDodge < -1)
       {
         PlayerDodge = -1;
       }
     }
      
     
   }
}
