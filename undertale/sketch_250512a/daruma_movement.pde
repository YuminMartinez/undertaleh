/*
class Position {
    float x, y;
}

class Daruma extends Position {

  Daruma(float x, float y, float sizeX, float sizeY)
    
}*/


void moveDaruma() {
  if ( attackone = true ) {
    if (key == 'w' || key == 'W') darumaY -= darumaSpeed;
    if (key == 's' || key == 'S') darumaY += darumaSpeed;
    if (key == 'a' || key == 'A') darumaX -= darumaSpeed;
    if (key == 'd' || key == 'D') darumaX += darumaSpeed;
  }
