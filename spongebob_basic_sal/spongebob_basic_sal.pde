PVector sponge;
PVector loc, acc, vel;
PImage spongebob;

void setup() {
 
  sponge= new PVector(75, 100);
  spongebob= loadImage("basic spongebob edit.png");
  size(850, 600);
  vel= new PVector(0, 0);
  loc= new PVector(width/2, height/2);
  acc= new PVector(0, 0);
}
void draw() {
  background(0,0,255);
  image(spongebob, loc.x, loc.y, sponge.x, sponge.y);  
  vel.add(acc);
  loc.add(vel);
  if (keyPressed) {
    if (key==CODED) {
      if (keyCode==RIGHT) {
        loc.x++;
      }
      if (keyCode==LEFT) {
        loc.x--;
      }
      if (keyCode==UP) {
        loc.y--;
      }
      if (keyCode==DOWN) {
        loc.y++;
      }
    }
  }
}

