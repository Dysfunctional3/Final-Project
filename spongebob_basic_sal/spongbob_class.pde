class Spongebob {
  float ssz;
  PVector spongesz;
  PVector loc, acc, vel;
  PImage spongebob;
  float jumpspeed;
  boolean isjumping;
  float ground;

  Spongebob() {
    spongesz= new PVector(75, 100);
    ground=height;
    spongebob= loadImage("basic spongebob edit.png");
    vel= new PVector(0, 0);
    loc= new PVector(width/2, ground-spongesz.y/2);
    acc= new PVector(0, 0);
    jumpspeed=15;
    isjumping=false;
  }
  void display() {
    image(spongebob, loc.x, loc.y, spongesz.x, spongesz.y);
  }
  void move() {
    vel.add(acc);
    loc.add(vel);
    if (isjumping && loc.y +spongesz.y/2>=height) {
      loc.y=height-spongesz.y/2;
      vel.y=0;
      acc.y=0;
      isjumping=false;
    }
    if (keyPressed) {
      if (keyCode==RIGHT) {
        loc.x+=1;
      } else {
        loc.x+=0;
      }

      if (keyCode==LEFT) {
        loc.x+=-1;
      } else {
        loc.x+=0;
      }
    }
  }
  void jump() {
    // if(keyCode==RIGHT){
    //       loc.x+=1; 
    //      }
    if (!isjumping) {
      vel.y=-8;
      acc.y=.15;
      //      if(keyCode==RIGHT){
      //       loc.x+=1; 
      //      }
      isjumping=true;
    }
  }
}

