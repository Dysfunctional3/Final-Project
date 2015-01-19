//Level 2 Buckets

class Bucket {
  PVector loc, vel, acc;
  PVector sz;
  float bLife;
  float decay;
  PImage bucketpic;

  Bucket() {
    //INITIALIZE VARIABLES
    loc = new PVector(width/2, 100);    //<--- LATER: spray from giant bucket or cannon or something
    vel = new PVector(random(-6,6), random(-4, -1));
    acc = new PVector(0, .15);
    //Bucket image
    bucketpic = loadImage("nasty_patty.png");   //<--- LATER: get chum bucket bucket picture
    sz = new PVector(bucketpic.width/2, bucketpic.height/2);

    //Age of bucket
    bLife = 255;
    decay = 255;
  }


  //MOVE Buckets
  void move() { 
    vel.add(acc);
    loc.add(vel);
  }


  //DISPLAY Buckets
  void display() {    
    image(bucketpic, loc.x, loc.y, sz.x, sz.y);
  }


  //BUCKET DIES WHEN LEAVES SCREEN
  void leave() { 
    if (loc.x + sz.x/2 > width || loc.x - sz.x/2 < 0) {
      bLife-=decay;
    }
    if (loc.y - sz.y/2 < 0) {
      bLife-=decay;
    }
  }

  //IS THE BUCKET GONE?
  boolean isGone() { 

    //RETURN TRUE IF BUCKET GONE, FALSE IF NOT
    if (bLife <=0) {
      return true;
    } else {
      return false;
    }
  }

  void hurtSponge(Spongebob s) {
    if (dist(loc.x, loc.y, s.loc.x, s.loc.y) < sz.y/2+s.sz.x/2) {
      s.life--;              //loses 1 life if in contact
      s.loc.x = s.sz.x/2;   // send spongebob back to beginning
    }
  }
}

