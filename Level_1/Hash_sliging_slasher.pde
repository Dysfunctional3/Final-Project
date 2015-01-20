//declare hash slinging slasher class
class Hash {
  //declare variables
  PVector sz;
  PVector loc, vel, acc;
  PImage hashslinger;
  boolean hashJumping = false;
  float locx;
  
  //work on this; doesn't work
  float hashDelay;
  float hashFinalDelay;

  //hash slinging slasher constructor
  Hash(float x) {
    //initialize variables
    //sz= new PVector(100, 95);
    locx = x;                                                //<---- I wonder why x=locx doesn't work, but locx = x works
    vel=new PVector(0, 0);
    acc= new PVector(0, 0);
    hashslinger= loadImage("hash_slinging_slasher.png");
    sz = new PVector(hashslinger.width/4, hashslinger.height/4);
    loc= new PVector(locx, height-sz.y);
    
    hashDelay = 0;
    hashFinalDelay = 60;
  }
  void display() {
    //display hash slinger image
    image(hashslinger, loc.x, loc.y, sz.x, sz.y);
  }
  void move() {
    //move hash slinger
    vel.add(acc);
    loc.add(vel);
  }

  void jump() {
    //hashslinger jumping
    hashDelay ++;
    
    //if it's not jumping
    if (!hashJumping && hashDelay == hashFinalDelay) {
      vel.y=-4;
      acc.y=.15;
      hashJumping=true;
      hashDelay = 0;
    }
    //once it comes back to the ground...
    if (hashJumping && loc.y +sz.y/2>=height) {
      loc.y=height-sz.y/2;
      hashJumping=false;
    }
  }

  void killSponge(Spongebob s) {
    if (dist(loc.x, loc.y, s.loc.x, s.loc.y) < sz.x/2+s.sz.x/2) {
      s.life--;
      s.loc.x = s.sz.x/2;
    }
  }

  /*  //if hash slinger touches right screen then vel reverses
   if(loc.x+hashsz.x>width){
   vel.x*=-1;
   } 
   //if hash slinger toughes left screen then vel reverses
   if(loc.x-hashsz.x/11<0){
   vel.x*=-1; 
   }
   }
   */
}

