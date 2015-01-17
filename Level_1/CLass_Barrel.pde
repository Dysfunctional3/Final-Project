class Barrel {

  //declare
  PImage barrelpic;
  PVector sz;
  PVector loc;

  Barrel() {
    barrelpic = loadImage("barrel.png");
    sz = new PVector (81, 102);
    loc = new PVector (width/2, height-sz.y/2);

  }

  void display() {
    image(barrelpic, loc.x, loc.y, sz.x, sz.y);
  }

}

