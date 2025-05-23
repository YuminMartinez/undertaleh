boolean estaSaltando = false;
boolean volviendo = false;

float xOriginal, yOriginal;
float xObjetivo, yObjetivo;

float velocidad = 5;  // velocidad de salto (ajustable)

boolean verCurvaInter = false;
boolean CanMove = false;

  void mousePressed() {
  
 if( gameState == GameState.FIRST_SANSATTACK) // para evitar un missClick y se active
 {
  CanMove = true;
  }
  }

void saltarEnDireccion(float xDestino, float yDestino) {
    gameControl = GameControl.CLICK_RATON;  // Fuerza el modo CLICK_RATON
    estaSaltando = true;
    volviendo = false;
    xOriginal = daruma.x;
    yOriginal = daruma.y;
    xObjetivo = xDestino;
    yObjetivo = yDestino;
}

void keyPressed() {
  if (SecondStageActive && !estaSaltando &&  !colisionActiva) {
    float distanciaSalto = 200;

    // Determina la dirección según la tecla de flecha
    if (keyCode == LEFT && posicionActual == PositionRect.DERECHA) 
    {
      saltarEnDireccion(daruma.x - distanciaSalto, daruma.y);  // Salto izquierda
    }
    else if (keyCode == RIGHT && posicionActual == PositionRect.IZQUIERDA) 
    {
      saltarEnDireccion(daruma.x + distanciaSalto, daruma.y);  // Salto derecha
    } 
    else if (keyCode == UP && posicionActual == PositionRect.ABAJO) 
    {
      saltarEnDireccion(daruma.x, daruma.y - distanciaSalto);  // Salto arriba
    } 
    else if (keyCode == DOWN && posicionActual == PositionRect.ARRIBA) 
    {
      saltarEnDireccion(daruma.x, daruma.y + distanciaSalto);  // Salto abajo
    }
  }

  if (keyCode == 'Q') {
    PJLife--;
  }
  if (keyCode == 'E') {
    PJLife++;
  }
  if (key == ' ' || keyCode == 32) {
    if (gameState == GameState.FIRST_STAGE) {
      gameState = GameState.TRANSITION;
      transitionX = 0;
    }
  }
  if (keyCode == 'P') {
    verCurvaInter = !verCurvaInter;
  }
  if(gameState == GameState.ENEMY_DEFEAT)
  {
    if(keyCode == ENTER && ended)
    {
      esc1 = false;
      esc2 = true;
    }
  }
  if (ReallyMercy) {
    if (keyCode == ENTER && Mercytext2) {
      CharNext = 0;
      ended = false;
      Mercytext2 = false;
      ReallyMercy = false;
      ChangeToMain = true;
      timeTransition = millis();
    }
    if (keyCode == ENTER && Mercytext1) {
      Mercytext1 = false;
      CharNext = 0;
      ended = false;
      Mercytext2 = true;
    }
  }

  if (EatFood) {
    if (keyCode == ENTER) {
      EatFood = false;
      Eated = false;
      ChangeToMain = true;
      CharNext = 0;
      ended = false;
      timeTransition = millis();
    }
  }

  if (lunchTime) {
    if (keyCode == ENTER) {
      lunchTime = false;
      EatFood = true;
    }
    if (keyCode == SHIFT) {
      lunchTime = false;
      MenuBattle = true;
    }
  }

  if (FindObject) {
    if (keyCode == ENTER) {
      FindObject = false;
      ChangeToMain = true;
      ended = false;
      firstSearch = false;
      CharNext = 0;
      if (possibility == 4) {
        WeaponFinded = true;
      }
      timeTransition = millis();
    }
  }

  if (CheckEnemy) {
    if (keyCode == ENTER && Checktext2) {
      Checktext2 = false;
      CheckEnemy = false;
      ChangeToMain = true;
      ended = false;
      CharNext = 0;
      timeTransition = millis();
    }
    if (keyCode == ENTER && Checktext1) {
      Checktext1 = false;
      Checktext2 = true;
      ended = false;
      CharNext = 0;
    }
  }

  if (ActMode) {
    if (keyCode == SHIFT) {
      ActMode = false;
      MenuBattle = true;
    }
    if (keyCode == UP) {
      ActSelection--;
      if (ActSelection < 0)
        ActSelection = 0;
    }
    if (keyCode == DOWN) {
      ActSelection++;
      if (ActSelection > 1)
        ActSelection = 1;
    }
    if (keyCode == ENTER) {
      switch (ActSelection) {
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

  if (atackMode) {
    if (keyCode == ENTER) {
      atackMode = false;
      AtaqueRealizado = true;
    }
  }

  if (actionSelected) {
    if (keyCode == SHIFT) {
      actionSelected = false;
      MenuBattle = true;
    }
    if (keyCode == ENTER) {
      actionSelected = false;
      atackMode = true;
    }
  }

  if (MenuBattle) {
    if (keyCode == LEFT) {
      player_choose--;
      if (player_choose < 0)
        player_choose = 0;
    }
    if (keyCode == RIGHT) {
      player_choose++;
      if (player_choose > 3)
        player_choose = 3;
    }
    if (keyCode == ENTER) {
      switch (player_choose) {
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
          break;
      }
    }
  }

  if (TrAttack) {
    if (keyCode == DOWN) {
      PlayerDodge++;
      if (PlayerDodge > 1) {
        PlayerDodge = 1;
      }
    }
    if (keyCode == UP) {
      PlayerDodge--;
      if (PlayerDodge < -1) {
        PlayerDodge = -1;
      }
    }
  }
}
