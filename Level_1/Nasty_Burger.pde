//Level 1 Nasty Burger

//declare nasty burger class

class Nastyburger {
  //declare variables
  PVector sz;
  PVector loc, vel, acc;
  PImage nastyburger;
  float locx;

  //nastyburger constructor
  Nastyburger(float x) {
    //initialize variables
    locx= x;
    nastyburger= loadImage("nasty_patty.png");
    sz= new PVector(nastyburger.width/2, nastyburger.height/2);
    vel= new PVector(1, 0);
    loc= new PVector(locx, height-sz.y/2);
    acc= new PVector(0, 0);
  }
  void display() {
    //display nasty patty
    image(nastyburger, loc.x, loc.y, sz.x, sz.y);
  }
  void move() {
    //move nasty patty
    vel.add(acc);
    loc.add(vel);


    //bounce off right screen
    if (loc.x+sz.x/2>width) {   //<--- should be sz.x/2; CROP IMAGES TUESDAY
      vel.x*=-1;
    }
    //bounce off left screen
    if (loc.x-sz.x/2<0) {       // same problem as above
      vel.x*=-1;
    }
  }

  void bounceOffBarrels(Barrel a, Barrel b) {

    if (loc.x-sz.x/2 < a.loc.x + a.totalW/2) {       // b = barrel on left side
      vel.x*=-1;
    }

    if (loc.x+sz.x/2> b.loc.x - b.totalW/2) {    //b = barrel on right side
      vel.x*=-1;
    }
  }

  //when touching character, kill him
  void hurtSponge(Spongebob s) {
    if (dist(loc.x, loc.y, s.loc.x, s.loc.y) < sz.x/2+s.sz.x/2) {
      s.life--;
      s.loc.x = s.sz.x/2;   // send spongebob back to beginning
    }
  }
}

