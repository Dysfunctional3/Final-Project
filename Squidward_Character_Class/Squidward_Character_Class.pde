class Squidward {

  PImage squidward;
  PVector squidsz;

  Squidward() {

    squidward=loadImage("squidward.gif");
    squidsz= new PVector(75, 100);
  }

  void display() {
    image(squidward, mouseX-squidsz.x/2, mouseY-squidsz.y/2);
  }
}

