class Barrel {

  //declare
  PImage barrelpic;
  PVector sz;
  PVector loc;
  float locx;

  PImage kelp, kelp2;
  PVector ksz, kloc, k2loc;
  
  float totalW;


  Barrel(float x) {
    locx = x;
    barrelpic = loadImage("barrel.png");
    sz = new PVector (barrelpic.width, barrelpic.height);
    loc = new PVector (locx, height-sz.y/2);

    kelp = loadImage("kelp.png");
    ksz = new PVector (kelp.width/4, kelp.height/4);  //<--- for both kelps; make image four times smaller
    kelp2 = loadImage("kelp.png");
    kloc = new PVector (loc.x - sz.x/2 - ksz.x/2, loc.y+8);
    k2loc = new PVector (loc.x + sz.x/2 + ksz.x/2, loc.y+8);
    
    //Width of the barrel including the two kelps
    totalW = sz.x + 2*ksz.x;
    
  }

  void display() {
    image(barrelpic, loc.x, loc.y, sz.x, sz.y);
    image(kelp, kloc.x,kloc.y,ksz.x,ksz.y);
    image(kelp, k2loc.x,k2loc.y,ksz.x,ksz.y);
  }

  void deathByKelp(Spongebob s) {
    //kelp placed next to barrels to cover up glitch
    //lose 1 life if spongebob touches kelp
    
    
    
    
  }
}

