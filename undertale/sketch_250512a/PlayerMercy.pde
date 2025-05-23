// Variables de MERCY

boolean ReallyMercy = false;
boolean Mercytext1 = false;
boolean Mercytext2 = false;

// Realmente crees que te perdonará???? Mataste a todos sus subditos para acabar con él


// Por mucho que lo intentes no te perdonara ;)
void TryToForgive()
{
  stroke(255);
  strokeWeight(5);
  fill(0);
  rect(width/6, height/1.8f,2*width/3, height/5);
  fill(255);
  textSize(48); 
  // Se imprime el texto sobre como no te va a perdonar poco a poco
  if(Mercytext1)
  {
    timeText = millis();
    String wordStats = "After killing all his subordinates, do you think he'll forgive you?";
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
  text(Visible, width/5.7f, height/1.6f);
  if(wordStats.length() == Visible.length())
  {
    
    ended = true;
  }
  }
  if(Mercytext2)
  {
    timeText = millis();
    String EnemyStats = "It's life or death, there are no other options" ;
    if(!ended)
    {
    if(CharNext < EnemyStats.length() && timeText - lastTime > vtext)
    {
      CharNext++;
      lastTime = timeText;
    }
    }
    textAlign(LEFT, LEFT);
    String Visible = EnemyStats.substring(0,CharNext);
    text(Visible, width/4.9f, height/1.6f);
    if(EnemyStats.length() == Visible.length())
  {
   
    ended = true;
  }
  }
  
}
