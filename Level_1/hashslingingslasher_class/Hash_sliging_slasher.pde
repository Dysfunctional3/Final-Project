//declare hash slinging slasher class
class Hashslingingslasher {
  //declare variables
  PVector hashsz;
  PVector loc, vel, acc;
  PImage hashslinger;
  //hash slinging slasher constructor
  Hashslingingslasher() {
    hashsz= new PVector(100, 95);
    loc= new PVector(width/2, height-hashsz.y);
    vel=new PVector(2,0);
    acc= new PVector(0,0);
    hashslinger= loadImage("hash_slinging_slasher.png");
  }
  void display(){
   image(hashslinger,loc.x,loc.y, hashsz.x,hashsz.y); 
  }
  void move(){
   vel.add(acc);
  loc.add(vel);
 if(loc.x+hashsz.x>width){
  vel.x*=-1;
 } 
 if(loc.x-hashsz.x/10<0){
  vel.x*=-1; 
 }
  }
}

