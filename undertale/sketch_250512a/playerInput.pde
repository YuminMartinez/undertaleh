boolean showSecondStage = false;




void keyPressed() 
{
  if (key == ' ' || keyCode == 32) 
  {  // Si se presiona la barra espaciadora
    if (gameState == GameState.FIRST_STAGE) 
    {
      gameState = GameState.TRANSITION;
        transitionX = 0;// Cambia al segundo estado
    }
  }
    if(MenuBattle)
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
    }
  
  
 
}
