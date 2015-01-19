//Kelp

class Kelp {

  //declare
  float locx, locy;
  PImage kelp;
  PVector sz, loc;


  Kelp(float x,float y) {
    locx = x;
    locy = y;
    kelp = loadImage("kelp.png");
    sz = new PVector (kelp.width/4, kelp.height/4);  //<--- for both kelps; make image four times smaller
    loc = new PVector (locx,locy);
  }

  void display() {
    image(kelp, loc.x, loc.y, sz.x, sz.y);
  }

  void deathByKelp(Spongebob s) {
    //lose 1 life if spongebob touches kelp
    if (dist(loc.x, loc.y, s.loc.x, s.loc.y) < sz.x/2+s.sz.x/2) {
      s.life--;
      s.loc.x = s.sz.x/2;
    }

  }
}

