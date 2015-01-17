//WORRY ABOUT SPONGEBOB FIRST

class Patrick {
  //declare
  PImage patrick;
  PVector sz;
  PVector loc, vel, acc;
  boolean isjumping = false;

  Patrick() {
    //initialize
    patrick = loadImage("patrick.png");
    sz = new PVector(patrick.width,patrick.height);
    loc = new PVector (width/2, height- sz.y/2); 
    vel = new PVector (0, 0);
    acc = new PVector (0, 1);
  }

  //display image
  void display() {
    //set mouse at center of image
    // image(patrick,mouseX-patsz.x/2,mouseY-patsz.y/2);
    image(patrick, loc.x, loc.y);
  }

  void move() {
    loc.add(vel);
    vel.add(acc);

    if (keyPressed) {
      if (keyCode == LEFT) {
        loc.x-=2;
      }
      if (keyCode == RIGHT) {
        loc.x+=2;
      }
    }
  }


  void jump() {
  }

  void die() {
  }
}

