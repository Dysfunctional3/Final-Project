class Spongebob {
  PVector sz;
  PVector loc, acc, vel;
  PImage spongebob;
  float jumpspeed;
  boolean isjumping;
  boolean onBarrel;
  float ground;

  Spongebob() {

    ground=height;
    spongebob= loadImage("basic spongebob edit.png");
    sz= new PVector(spongebob.width, spongebob.height);
    vel= new PVector(0, 0);
    loc= new PVector(width/4, ground-sz.y/2);
    acc= new PVector(0, 0);
    jumpspeed=15;
    isjumping=false;
    onBarrel = false;
  }
  void display() {
    image(spongebob, loc.x, loc.y);
    //  image(spongebob, loc.x, loc.y, sz.x, sz.y);
  }
  void move() {
    vel.add(acc);
    loc.add(vel);
    if (isjumping && loc.y +sz.y/2>=height) {   // stops jumping when it hits the ground
      loc.y=height-sz.y/2;
      vel.y=0;
      acc.y=0;
      isjumping=false;
    }
    if (keyPressed) {
      if (keyCode==RIGHT) {
        loc.x+=3;
      } else {
        loc.x+=0;
      }

      if (keyCode==LEFT) {
        loc.x+=-3;
      } else {
        loc.x+=0;
      }
    }
  }
  void jump() {
    //if it's not jumping and mouse pressed, jump
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
    // land on barrel after juping
    if (isjumping && loc.x + sz.x/2> b.loc.x - b.sz.x/2 && loc.x - sz.x/2 <= b.loc.x + b.sz.x/2) {  //if jumping and location moves to above the barrel   // sz.x/4 to try to make more realistic
      if (loc.y +sz.y/2>=b.loc.y-b.sz.y/2) {
        loc.y=b.loc.y-b.sz.y/2-sz.y/2;
        vel.y=0;
        acc.y=0;
        isjumping=false;
        println("landOnBarrel");
        onBarrel = true;
      }
    } else if (onBarrel && !(loc.x + sz.x/2> b.loc.x - b.sz.x/2 && loc.x - sz.x/2 <= b.loc.x + b.sz.x/2)) {
      isjumping = true; 
      acc.y = .2;
      onBarrel = false;
      //later: fix spongebob not jumping when right next to barrel
    }
  }

  void touchBarrel( Barrel b) {  
    //doesn't work
    /*   if (loc.y + sz.y/2 > b.loc.y - b.sz.y/2) {    //if bottom of spongebob touches the top of the barrel and...
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
     }
     */

    // if (loc.y - b.loc.y <= sz.y/2 + b.sz.y/2) {
    /*  if (loc.x + sz.x/2 + 20> b.loc.x - b.sz.x/2 && loc.x - sz.x/2 -20< b.loc.x + b.sz.x/2 && loc.y >= b.loc.y - sz.y/2 + b.sz.y/2) {   // +/- 20 added because the corners of the barrel is empty space
     loc.y = b.loc.y - sz.y/2 + b.sz.y/2;
     }
     */

    //THIS WORKS
    //still have to figure out what to do if keyCode == " "

    //sides
    if (abs(loc.x - b.loc.x) <= sz.x/2 + b.sz.x/2) {
      if (loc.y +  sz.y/2 > b.loc.y-b.sz.y/2 && loc.y - sz.y/2 < b.loc.y+b.sz.y/2) {
        /* if (loc.y + sz.y/2 > b.loc.y - b.sz.y/2){
         loc.x+=0;  */
        if (keyCode == RIGHT) {
          loc.x = b.loc.x -b.sz.x/2-sz.x/2;
        }
        if (keyCode == LEFT) {
          loc.x = b.loc.x +b.sz.x/2+sz.x/2;
        }
      }
    }
  }
}

