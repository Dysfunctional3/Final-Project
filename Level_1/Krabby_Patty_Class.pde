//collect krabby patties to gain lives in transition

///////////FIX THIS

class KPatty {
  //declare variables
  PVector sz;
  PVector loc;
  PImage kPatty;
  float locx;

  KPatty(float x) {
    //initialize variables
    x = locx;
    kPatty= loadImage("patty.png");
    sz= new PVector(kPatty.width/5, kPatty.height/5);
    loc= new PVector(locx, height-sz.y/2);
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
  }
}

