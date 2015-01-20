//collect krabby patties to gain lives in transition

///////////FIX THIS

class KPatty {
  //declare variables
  PVector sz;
  PVector loc,vel,acc;
  PImage kPatty;
  float locx;
  int kLife;
  int decay;

  KPatty() {
    //initialize variables
    //    locx = x;
    kPatty= loadImage("patty.png");
    sz= new PVector(kPatty.width/10, kPatty.height/10);
    loc = new PVector(width/2, height-sz.x/2);
    vel = new PVector(random(-4, 4), random(-5, -15));
    acc = new PVector(0, .15);

    kLife = 255;
    decay = 255;
  }

  void move() { 
    vel.add(acc);
    loc.add(vel);
  }


  //complete all actions
  void run(Spongebob s) {
    //display kPatty
    image(kPatty, loc.x, loc.y, sz.x, sz.y);

    //if Spongebob touches, add one life
    if (dist(loc.x, loc.y, s.loc.x, s.loc.y) < sz.x/2+s.sz.x/2) {
      s.life++;

      //get off screen after use
      loc.x = -sz.x/2;
    }

    //make krabby patty return when playing again  
    //    void returnAfterEnd(){
    //      if (
    //        loc.x = locx;
    //    }
    //  }
  }

  boolean isGone() { 

    //RETURN TRUE IF PATTY GONE, FALSE IF NOT
    if (kLife <=0) {
      return true;
    } else {
      return false;
    }
  }
}


