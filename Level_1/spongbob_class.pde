//Player 1

class Spongebob {
  PVector sz;
  PVector loc, acc, vel;
  PImage spongebob;
  boolean isjumping;
  boolean onBarrel;
  float ground;

  //life
  int life;

  Spongebob() {
    ground=height;
    spongebob= loadImage("basic spongebob edit.png");
    sz= new PVector(2*spongebob.width/3, 2*spongebob.height/3);   //<--- make spongebob 2/3 the image size
    vel= new PVector(0, 0);
    loc= new PVector(sz.x/2, ground-sz.y/2);
    acc= new PVector(0, 0);
    //    jumpspeed=15;
    isjumping=false;
    onBarrel = false;

    //start with 10 lives
    life = 10;
  }

  void textDisplay() {
    textSize(25);

    //display number of lives
    text("Lives: " + life, 100, 30);
  }


  void display() {
    image(spongebob, loc.x, loc.y, sz.x, sz.y);
  }


  void move() {
    vel.add(acc);
    loc.add(vel);
    //if it's in the process of jumping...
    if (isjumping && loc.y +sz.y/2>=height) {   // stops jumping when it hits the ground
      loc.y=height-sz.y/2;
      vel.y=0;
      acc.y=0;
      isjumping=false;
    }

    //if right or left arrow pressed, move
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

    //don't let spongebob move through the left wall
    if (loc.x - sz.x/2 <0) {
      loc.x = sz.x/2;
    }
  }
  void jump() {
    //if it's not jumping and mouse pressed, jump
    if (!isjumping) {
      vel.y=-6;
      acc.y=.15;
      //      if(keyCode==RIGHT){
      //       loc.x+=1; 
      //      }
      isjumping=true;
    }
  }

  void landOnBarrel(Barrel b) {
    // land on barrel after jumping

    if (isjumping && loc.x + sz.x/2> b.loc.x - b.sz.x/2 && loc.x - sz.x/2 <= b.loc.x + b.sz.x/2) {  //if jumping and location moves to above the barrel
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
      acc.y = .15;
      onBarrel = false;
      //later: fix spongebob not jumping when right next to barrel
    }
  }

  void touchBarrel( Barrel b) {  
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

  // Is Spongebob dead?
  boolean isDead() {
    if (life < 1) {
      return true;
    } else {
      return false;
    }
  }
}




