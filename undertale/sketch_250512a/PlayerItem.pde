
// Variables de ITEMS

boolean lunchTime = false;
boolean EatFood = false;
boolean Eated = false;
int healthRecovered = 0;

// Se imprime los Objetos que dispone el Jugador
void PrintBackpack()
{
 
  stroke(255);
  strokeWeight(5);
  fill(0);
  rect(width/6, height/1.8f,2*width/3, height/5);
  fill(255);
  textSize(48);
  textAlign(LEFT, LEFT);
  text("Dango", width/4.7f, height/1.52f); 
  image(img, width/6, height/1.65f,width/21.33f,height/13.5f);
}

// Se come la comida, curandose y se imprime un text diciendo la cantidad de vida que se ha curado
void EatFood()
{
  if(!Eated)
  {
    healthRecovered = (int)random(25,40);
    PJLife += healthRecovered;
    Eated = true;
  }
  
  stroke(255);
  strokeWeight(5);
  fill(0);
  rect(width/6, height/1.8f,2*width/3, height/5);
  fill(255);
  textSize(48); 
    timeText = millis();
    String EatText = "You have eaten the dango and have recovered " + healthRecovered + "HP";
    if(!ended)
    {
    if(CharNext < EatText.length() && timeText - lastTime > vtext)
    {
      CharNext++;
      lastTime = timeText;
    }
    }
    textAlign(LEFT, LEFT);
  String Visible = EatText.substring(0,CharNext);
  text(Visible, width/4.9f, height/1.6f);
  if(EatText.length() == Visible.length())
  {
    
    ended = true;
  }
}
