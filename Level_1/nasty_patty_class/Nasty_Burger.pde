class Nastyburger {
  
  PVector pattysz;
  PVector loc, vel, acc;
  PImage nastyburger;

  Nastyburger() {
    pattysz= new PVector(100, 50);
    nastyburger= loadImage("nasty_patty.png");
    vel= new PVector(1, 0);
    loc= new PVector(width/2, height+pattysz.y);
    acc= new PVector(0, 0);
  }
  void display() {
    image(nastyburger, loc.x, loc.y, pattysz.x, pattysz.y);
  }
  void move() {
    vel.add(acc);
    loc.add(vel);
    if (loc.x+pattysz.x>width) {
      vel.x*=-1;
    }
    if (loc.x+pattysz.x<0) {
      vel.x*=-1;
    }
  }
}

