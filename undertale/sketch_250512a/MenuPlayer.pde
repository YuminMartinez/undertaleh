
void ActionsPlayer()
{
 PrintEnemy();
    secondStage();
    PrintVidaPNJ();
    if(actionSelected || ActMode || lunchTime || ReallyMercy)
    {
      switch(player_choose)
      {
      case 0:
          PJAttack();
          break;
       case 1:
         PJAct();
         break;
       case 2:
         PrintBackpack();
         break;
       case 3:
         TryToForgive();
         break;
      }
    }
    if(EatFood)
    {
      EatFood();
    }
    if(CheckEnemy)
    {
      CheckStatsEnemy();
    }
    if(FindObject)
    {
      SearchObject();
    }
    
    if(atackMode && !actionSelected && AtaqueRealizado == false)
      {
        PrintBarraAtaque();
      }
    else if (AtaqueRealizado == true)
      {
       PNJRecibirDaño(CalcularDañoPJ()); 
       AtaqueRealizado = false;
        ChangeToMain = true;
        timeTransition = millis();
       //MenuBattle = true;
       }

}
