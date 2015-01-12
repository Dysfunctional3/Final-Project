class Spongebob {
  PVector ssz;
  PVector loc, acc, vel;
  PImage spongebob;
  float grav;
  float ground;
  float jumpspeed;
  //  float drag;
  float isjumping;
  float yinc;
  Spongebob() {
    ssz= new PVector(75, 100);
    ground=500;
    spongebob= loadImage("basic spongebob edit.png");
    vel= new PVector(0, 0);
    loc= new PVector(500, ground);
    acc= new PVector(0, 0);
    grav=.5;
    jumpspeed=15;
    //    drag=1;
    isjumping=0;
  }
  void display() {
    image(spongebob, loc.x, loc.y, ssz.x, ssz.y);
  }
  void move() {
    vel.add(acc);
    loc.add(vel);
    if (keyPressed==true) {
      if (key==CODED) {
        if (keyCode==RIGHT) {
          loc.x++;
        }
        if (keyCode==LEFT) {
          loc.x--;
        }
      }
    }
  }

  void jump() {
    if (keyPressed==true) {
      if (key==CODED) {
        if (keyCode== UP || isjumping==0) { 
          //          if (loc.y<ground)
          //            vel.y+=grav;
          //        } else {
          //          vel.y=0;
          //        }
          //        if (loc.y>=ground) {
          //          vel.y= -jumpspeed;
          //          jumpspeed=drag;
          //          ssz.y-=jumpspeed;
          isjumping=1;
          jumpspeed=-15;
        }
      }
    }
  
if (isjumping==1) {
  loc.y--;
}
if(keyPressed==false){
isjumping=1;
yinc=0;
}
//if(isjumping==1){
// isjumping=1;
//yinc=0; 
//}

  }
}
