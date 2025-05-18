class Position {
  float x, y;
  float sizeX, sizeY;

  Position(float x, float y, float sizeX, float sizeY) {
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
  }
}

class Daruma extends Position {
     PImage img;
  Daruma(float x, float y, float sizeX, float sizeY,PImage img) {

    super(x, y, sizeX, sizeY);
     this.img = img;
  }
    

  void display() {
    image(img, x, y, sizeX, sizeY);
  }
}
