//SPONGEBOB PLAYER

class Spongebob {
  //declare variables
  
  PVector sz;
  PVector loc, acc, vel;
  
  boolean isjumping;
  boolean onBarrel;
  
  //Spongebob images
  PImage spongebob;
  PImage spongeleft;
  PImage spongejump;

  //life
  int life;

  Spongebob() {

    //Spongebob with right key
    spongebob= loadImage("basic spongebob edit.png");

    //Spongebob with left key
    spongeleft= loadImage("spongeleft.png");

    //Spongebob while jumping
    spongejump= loadImage("sponge_jump.png");

    //Spongebob size
    sz= new PVector(2*spongebob.width/3, 2*spongebob.height/3);   //<--- make spongebob 2/3 the image size

    //Starts with a speed of 0
    vel= new PVector(0, 0);

    //Starts out in lower left corner
    loc= new PVector(sz.x/2, height-sz.y/2);
    
    //no acceleration until jumping
    acc= new PVector(0, 0);

    //Starts out not jumping
    isjumping=false;

    //Starts out not on a barrel
    onBarrel = false;

    //start with 10 lives
    life = 10;
  }

  //display lives on screen
  void textDisplay() {
    
    //text properties
    textSize(25);
    
    //if on transition page and level 1 page, text white
    //if not, keep it blue
    if (level != 1.5){
    fill(0, 100, 255);
    } else{
    fill(255);
    }

    //display number of lives
    text("Lives: " + life, 100, 30);
  }


  //display Spongebob's different images
  void display() { 

    //If jumping, use Spongebob jumping picture
    if (isjumping) {
      image(spongejump, loc.x, loc.y, sz.x*1.2, sz.y*1.2);     //<--- make jumping pic slightly bigger bc smaller than others
    } else { 
      //if it's not jumping and...
      if (!isjumping) {
        //...and a key is pressed...
        if (keyPressed) {
          //if left key pressed, use left Spongebob
          if (keyCode==LEFT) {
            image(spongeleft, loc.x, loc.y, sz.x, sz.y);
          }
          //if right key pressed, use right Spongebob
          if (keyCode == RIGHT) {
            image(spongebob, loc.x, loc.y, sz.x, sz.y);
          }
        } else {
          //if no key pressed, use right Spongebob as default
          image(spongebob, loc.x, loc.y, sz.x, sz.y);
        }
      }
    }
  }

//Spongebob moves
  void move() {
    //add PVectors
    vel.add(acc);
    loc.add(vel);
    
    //if it's in the process of jumping...
    if (isjumping && loc.y +sz.y/2>=height) {
      // stop jumping when it hits the ground
      loc.y=height-sz.y/2;
      vel.y=0;
      acc.y=0;
      isjumping=false;
    }

    //if a key is pressed pressed...
    if (keyPressed) {
      //if right key pressed, move right
      if (keyCode==RIGHT) {
        loc.x+=3;
      } else {
        //no key pressed, don't move
        loc.x+=0;
      }
      
      //if left key pressed, move left
      if (keyCode==LEFT) {
        loc.x+=-3;
      } else {
        //no key pressed, don't move
        loc.x+=0;
      }
    }

    //don't let spongebob move through the left wall
    if (loc.x - sz.x/2 <0) {
      loc.x = sz.x/2;
    }
  }
  
  //Make spongebob jump
  void jump() {
    
    //if it's not currently jumping, allow Spongebob to jump
    if (!isjumping) {
      vel.y=-6;
      acc.y=.15;
      //      if(keyCode==RIGHT){
      //       loc.x+=1; 
      //      }
      isjumping=true;
    }
  }

//Landing on barrels
  void landOnBarrel(Barrel b) {
    
    // If land on barrel after jumping...
    if (isjumping && loc.x + sz.x/2> b.loc.x - b.sz.x/2 && loc.x - sz.x/2 <= b.loc.x + b.sz.x/2) {  //if jumping and location moves to above the barrel
      if (loc.y +sz.y/2>=b.loc.y-b.sz.y/2) {
        //stay on top of barrel
        loc.y=b.loc.y-b.sz.y/2-sz.y/2;
        vel.y=0;
        acc.y=0;
        isjumping=false;
        
        //checking if barrels working
        println("landOnBarrel");
        
        onBarrel = true;
      }
    } else
    //else, if Spongebob is on barrel and gets off, fall.
    if (onBarrel && !(loc.x + sz.x/2> b.loc.x - b.sz.x/2 && loc.x - sz.x/2 <= b.loc.x + b.sz.x/2)) {
      isjumping = true; 
      acc.y = .15;
      onBarrel = false;
    }
  }

// If spongebob touches the sides of the barrels
  void touchBarrel( Barrel b) {  
    
    //Not letting Spongebob go through sides
    if (abs(loc.x - b.loc.x) <= sz.x/2 + b.sz.x/2) {
      if (loc.y +  sz.y/2 > b.loc.y-b.sz.y/2 && loc.y - sz.y/2 < b.loc.y+b.sz.y/2) {
        //if coming from the right
        if (keyCode == RIGHT) {
          loc.x = b.loc.x -b.sz.x/2-sz.x/2;
        }
        //if coming from the left
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

