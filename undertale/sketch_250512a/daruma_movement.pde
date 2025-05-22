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

  Daruma(float x, float y, float sizeX, float sizeY, PImage img) {
    super(x, y, sizeX, sizeY);
    this.img = img;
  }

  void display() {
    image(img, x, y, sizeX, sizeY);
  }
  
  void limitarMovimiento(float minX, float minY, float maxX, float maxY) {
  x = constrain(x, minX, maxX - sizeX);
  y = constrain(y, minY, maxY - sizeY);
}
  
}

PImage RecibeDaño(PImage p)
{
  p.loadPixels(); // Necesario para modificar p.pixels[]

  for (int i = 0; i < p.width; i++) {
    for (int j = 0; j < p.height; j++) {
      int index = j * p.width + i;
      color c = p.pixels[index];

      if ((red(c) >= 197 && red(c) < 200) && (green(c) >= 44 && green(c) < 50 ) && (blue(c) >= 28 && blue(c) < 30)) {
        p.pixels[index] = color(0, 84, 255);
      }

      if (red(c) == 174 && green(c) == 31 && blue(c) == 37) {
        p.pixels[index] = color(0, 47, 255);
      }
    }
  }

  p.updatePixels(); // Aplicar los cambios
  return p;
}
