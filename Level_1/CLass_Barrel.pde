class Barrel {

  //declare
  PImage barrelpic;
  PVector sz;
  PVector loc;

  float barrelTop;
  float barrelLeft;
  float barrelRight;


  Barrel(float x, float y) {
    barrelpic = loadImage("barrel.png");
    sz = new PVector (barrelpic.width,barrelpic.height);
    loc = new PVector (x,y);
//    barrelTop = loc.y - sz.y/2;
//    barrelLeft = loc.x-sz.x/2;
//    barrelRight = loc.x +sz.x/2;
    
        x = loc.x;
        y = loc.y;
  }

  void display() {
    image(barrelpic, loc.x, loc.y, sz.x, sz.y);
  }

//don't use this
//  void jumpedOnBy(Spongebob play) {
//    // void jumpedOnBy(Patrick play) {
//    if (play.loc.x >=barrelLeft - play.sz.x/2 && play.loc.x <= barrelRight) {
//
//      if (play.loc.y <= barrelTop - play.sz.y/2) {
//        play.loc.y = barrelTop - play.sz.y/2;
//      }
//    }
//  }
}

