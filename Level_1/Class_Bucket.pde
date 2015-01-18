//Level 2 Buckets

class Bucket {
  PVector loc, vel, acc;
  float sz;
  float bLife;
  float decay;
  PImage bucketpic;

  Bucket() {
    //INITIALIZE VARIABLES
    loc = new PVector(width, height/4);    //<--- LATER: spray from giant bucket or cannon or something
    vel = new PVector(random(-4,1), random(-4, 2));
    acc = new PVector(0, .15);
    sz = random(30, 50);

    //Age of bucket
    bLife = 255;
    decay = 255;

    //Bucket image
    bucketpic = loadImage("nasty_patty.png");   //<--- LATER: get chum bucket bucket picture
  }


  //MOVE Buckets
  void move() { 
    vel.add(acc);
    loc.add(vel);
  }


  //DISPLAY Buckets
  void display() {    
    image(bucketpic, loc.x, loc.y, sz, sz);
  }


  //BUCKET DIES WHEN LEAVES SCREEN
  void leave() { 
    if (loc.x + sz/2 > width || loc.x - sz/2 < 0) {
      bLife-=decay;
    }
    if (loc.y + sz/2 > height || loc.y - sz/2 < 0) {
      bLife-=decay;
    }
  }

  //IS THE BUCKET GONE?
  boolean isGone() { 

    //RETURN TRUE IF BUCKET GONE, FALSE IF NOT
    if (bLife <0) {
      return true;
    } else {
      return false;
    }
  }

  void hurtSponge(Spongebob s) {
    if (dist(loc.x, loc.y, s.loc.x, s.loc.y) < sz/2+s.sz.x/2) {
      s.life--;              //loses 1 life if in contact
      s.loc.x = s.sz.x/2;   // send spongebob back to beginning
    }
  }
}

