//TRANSITION KRABBY PATTIES

class KPatty {
  //declare variables
  PVector sz;
  PVector loc,vel,acc;
  
  PImage kPatty;
  
  //life and death of KP
  int kLife;
  int decay;
  
  //for specifying where the location is
  float locx;
  float locy;
  
  //is KP dead?
  boolean kpDead = false;

  KPatty() {
    //initialize variables
    
    kPatty= loadImage("patty.png");
    
    //size of KP
    sz= new PVector(kPatty.width/10, kPatty.height/10);
    
    //location of KP
    loc = new PVector(width/2, height-sz.x/2);
    
    //velocity of KP
    vel = new PVector(random(-5, 5), random(-10, -15));
    
    //downward acceleration (gravity)
    acc = new PVector(0, .15);

    //initialize life and death
    kLife = 255;
    decay = 255;
  }

  //moves KP
  void move() { 
    vel.add(acc);
    loc.add(vel);
  }

  //if KP leave screen, kill off
  void leave() { 
    if (loc.x + sz.x/2 > width || loc.x - sz.x/2 < 0) {
      kLife-=decay;
    }
    if (loc.y - sz.y/2 > height) {
      kLife-=decay;
    }
  }

  //display and collect
  void run(Spongebob s) {
    
    //display kPatty
    image(kPatty, loc.x, loc.y, sz.x, sz.y);

    //if Spongebob touches, add one life and take away KP
    if (dist(loc.x, loc.y, s.loc.x, s.loc.y) < sz.x/2+s.sz.x/2) {
      s.life++;
      kLife -= decay;
      kpDead = true;
    }

  }

  //is KP death?
  boolean isGone() { 
    //return true if patty is dead, false if not
    if (kLife <=0 && kpDead) {
      return true;
    } else {
      return false;
    }
  }
  
  //to change the location of KP
  void changeLoc( float x, float y){
    locx = x;
    locy= y;
    loc.set(locx,locy);
  }
  
}


