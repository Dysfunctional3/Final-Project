class Spongebob {
  PVector sz;
  PVector loc, acc, vel;
  PImage spongebob;
  float jumpspeed;
  boolean isjumping;
  float ground;

  Spongebob() {
    sz= new PVector(100, 100);
    ground=height;
    spongebob= loadImage("basic spongebob edit.png");
    vel= new PVector(0, 0);
    loc= new PVector(width/4, ground-sz.y/2);
    acc= new PVector(0, 0);
    jumpspeed=15;
    isjumping=false;
  }
  void display() {
    image(spongebob, loc.x, loc.y);
    //  image(spongebob, loc.x, loc.y, sz.x, sz.y);
  }
  void move() {
    vel.add(acc);
    loc.add(vel);
    if (isjumping && loc.y +sz.y/2>=height) {
      loc.y=height-sz.y/2;
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

  void landOnBarrel(Barrel b) {
    //doesn't work
    if (loc.y + sz.y/2 > b.loc.y - b.sz.y/2) {    //if bottom of spongebob touches the top of the barrel and...
      if (loc.x+sz.x/2 > b.loc.x-b.sz.x/2) {      //... if the right side touches the left side of the barrel,
        loc.x = b.loc.x - b.sz.x/2 - sz.x/2;     //then set the location there.
      } 
      if (loc.x-sz.x/2 < b.loc.x+b.sz.x/2) {      //...if the left side touches the right side of the barrel,
        loc.x = b.loc.x + b.sz.x/2 + sz.x/2;     //then set the location there
      }
    }
    if ((loc.x + sz.x/2 >= b.loc.x - b.sz.x/2) && (loc.x <= b.loc.x + b.sz.x/2)) {
      if (loc.y + sz.y/2 >b.loc.y - sz.y/2) {
        loc.y = b.loc.y - b.sz.y/2 - sz.y/2;
      }
    }
    // */

    // try again
    // if (loc.y + sz.y/2 < b.loc.y + b.sz.y/2){
  }
}
