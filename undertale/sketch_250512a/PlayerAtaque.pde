void PJAttack()
{
  noFill();
  stroke(255);
  strokeWeight(5);
  rect(width/6, height/1.8f,2*width/3, height/5);
  img = loadImage("daruma.png");
  image(img, width/6, height/1.6f,width/21.33f,height/13.5f);
  fill(255);
  textSize(48);
  text("*Insertar Nombre enemigo*", width/2.8f, height/1.5f);
}
void PrintBarraAtaque()
{
  // Ataque flojo
  fill(255,0,0);
  stroke(255);
  strokeWeight(5);
  rect(pXrojo,height/1.8f,disRojo, height/5);
  // Ataque medio
  fill(255,255,0);
  strokeWeight(0);
  rect(pXrojo+disRojo*0.3f,height/1.8f,disRojo*0.4f, height/5);
  // Ataque fuerte
   fill(0,255,0);
  strokeWeight(0);
  rect(pXrojo+disRojo*0.45f,height/1.8f,disRojo*0.1f, height/5);
  //width*0.4f
  fill(255);
   stroke(0);
  strokeWeight(7);
  rect(barraAtaque,height/1.8f,20, height/5);
  barraAtaque+= 30;
  if(barraAtaque >=width*0.84f)
  {
    atackMode = false;
    MenuBattle = true;
    barraAtaque = width/6;
  }
  
}

int  CalcularDañoPJ()
{
  int dmg = 0;
  float zonaRojaInicio = pXrojo;
  float zonaRojaFin = pXrojo + disRojo * 0.3f;
  
  float zonaAmarillaInicio = pXrojo + disRojo * 0.3f;
  float zonaAmarillaFin = pXrojo + disRojo * 0.7f;
  
  float zonaVerdeInicio = pXrojo + disRojo * 0.45f;
  float zonaVerdeFin = pXrojo + disRojo * 0.55f;

  if ((barraAtaque >= zonaRojaInicio && barraAtaque < zonaRojaFin) || (barraAtaque >=zonaAmarillaFin && barraAtaque <=pXrojo+disRojo)) 
  {
    dmg = (int)random(10, 20);
  } 
  if (barraAtaque >= zonaAmarillaInicio && barraAtaque < zonaAmarillaFin) 
  {
    dmg = (int)random(30, 50);
  } 
  if (barraAtaque >= zonaVerdeInicio && barraAtaque < zonaVerdeFin) 
  {
    dmg = (int)random(60, 90);
  } 
  barraAtaque = width/6;
  if(WeaponFinded == true)
  {
    dmg += 50;
  }
  return dmg;
}
