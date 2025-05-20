boolean showSecondStage = false;




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
  if(FindObject)
  {
    if(keyCode == ENTER)
    {
      FindObject = false;
      ChangeToMain = true;
    }
  }
  if(CheckEnemy == true)
  {
    if(keyCode == ENTER && Checktext2 ) 
       {
         
         Checktext2 = false;
         CheckEnemy = false;
         ChangeToMain = true; 
         CharNext = 0;
         
       }
    if(keyCode == ENTER && Checktext1)
    {
      Checktext1 = false;
      Checktext2 = true;
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
         }
            
       }
    }
   
 
  
 
}
