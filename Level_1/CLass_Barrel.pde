class Barrel {

  //declare
  PImage barrelpic;
  PVector sz;
  PVector loc;

  float barrelTop;
  float barrelLeft;
  float barrelRight;


  Barrel() {
    barrelpic = loadImage("barrel.png");
    sz = new PVector (81, 102);
    loc = new PVector (width/2, height-sz.y/2);
    barrelTop = loc.y - sz.y/2;
    barrelLeft = loc.x-sz.x/2;
    barrelRight = loc.x +sz.x/2;
  }

  void display() {
    image(barrelpic, loc.x, loc.y, sz.x, sz.y);
  }

//don't use this
  void jumpedOnBy(Spongebob play) {
    // void jumpedOnBy(Patrick play) {
    if (play.loc.x >=barrelLeft - play.sz.x/2 && play.loc.x <= barrelRight) {

      if (play.loc.y <= barrelTop - play.sz.y/2) {
        play.loc.y = barrelTop - play.sz.y/2;
      }
    }
  }
}

