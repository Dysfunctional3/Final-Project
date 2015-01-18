class Barrel {

  //declare
  PImage barrelpic;
  PVector sz;
  PVector loc;
  float locx;

  PImage kelp, kelp2;
  PVector ksz, kloc, k2loc;


  Barrel(float x) {
    locx = x;
    barrelpic = loadImage("barrel.png");
    sz = new PVector (barrelpic.width, barrelpic.height);
    loc = new PVector (locx, height-sz.y/2);

    kelp = loadImage("kelp.png");
    ksz = new PVector (kelp.width, kelp.height);  //<--- for both kelps
    kelp2 = loadImage("kelp.png");
    
    //why is location so off? Fix later
    kloc = new PVector (loc.x - sz.x/2 - ksz.x/2, loc.y);
    k2loc = new PVector (loc.x + sz.x/2 + ksz.x/2, loc.y);
  }

  void display() {
    image(barrelpic, loc.x, loc.y, sz.x, sz.y);
    image(kelp, kloc.x,kloc.y,ksz.x/4,ksz.y/4);   //<--- make kelp four times smaller
    image(kelp, k2loc.x,k2loc.y,ksz.x/4,ksz.y/4);
  }

  void WithKelp() {
    //kelp placed next to barrels to cover up glitch
  }
}

