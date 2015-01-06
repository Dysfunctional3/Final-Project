PVector sponge;

PImage spongebob;

void setup() {
  sponge= new PVector(75, 100);
  spongebob= loadImage("basic spongebob edit.png");
  size(850, 600);
}
void draw() {
  image(spongebob, width/2, height/2, sponge.x, sponge.y);  
  if (key==CODED) {
    if (keyCode==RIGHT) {
      sponge++;
    }
  }else if (keyCode==LEFT){
    sponge--;
  }
}

