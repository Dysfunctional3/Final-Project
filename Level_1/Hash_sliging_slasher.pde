//LEVEL 1 HASH SLINGING SLASHER OBSTACLE

class Hash {
  //declare variables
  PVector sz;
  PVector loc, vel, acc;

  PImage hashslinger;

  boolean hashJumping = false;

  float locx;

  //delay for jumping
  float hashDelay;
  float hashFinalDelay;

  //hash slinging slasher constructor
  Hash(float x) {
    //initialize variables

    //be able to decide where location is
    locx = x;  

    //no acceleration or velocity at start
    vel=new PVector(0, 0);
    acc= new PVector(0, 0);

    //image of hash slinging slasher
    hashslinger= loadImage("hash_slinging_slasher.png");

    //size
    sz = new PVector(hashslinger.width/4, hashslinger.height/4);

    //location
    loc= new PVector(locx, height+sz.y/2);

    //delay on jumping initialized
    hashDelay = 0;
    hashFinalDelay = 120;
  }

  //display hash slinger image
  void display() {

    image(hashslinger, loc.x, loc.y, sz.x, sz.y);

    //hole he jumps out of
    fill(0);
    ellipse(loc.x, height, sz.x, 10);
  }

  //move hash slinger
  void move() {
    vel.add(acc);
    loc.add(vel);
    hashDelay ++;
  }

  //hashslinger jumping
  void jump() {

    //if it's not jumping and delay equals final delay...
    if (!hashJumping && hashDelay == hashFinalDelay) {
      //jump
      vel.y=-8;
      acc.y=.15;
      hashDelay=0;
      hashJumping=true;
    }

    //once it comes back to the ground...
    if (hashJumping && loc.y +sz.y/2>=height) {
      // set it underneath the hole
      loc.y=height-sz.y/2;
      hashJumping=false;
    }
  }

  //kill Spongebob
  void killSponge(Spongebob s) {
    //if in contact with Spongebob, 
    if (dist(loc.x, loc.y, s.loc.x, s.loc.y) < sz.x/2+s.sz.x/2) {
      //kill and send him back to beginning
      s.life--;
      s.loc.x = s.sz.x/2;
    }
  }
}

