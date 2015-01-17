PImage krustyKrab;
Barrel barr;
Patrick pat;
Spongebob sponge;
Nastyburger nasty;


void setup() {
  size(1500, 577);
  krustyKrab = loadImage("krusty_krab_final.jpg");
  //  pat = new Patrick ();
  sponge = new Spongebob ();
  barr = new Barrel();
  nasty= new Nastyburger();
  imageMode(CENTER);
}

void draw() {
  background(krustyKrab);

  //  pat.display();
  //  pat.move();

  sponge.display();
  sponge.move();
  sponge.landOnBarrel(barr);
  sponge.touchBarrel(barr);

  barr.display();
  //barr.jumpedOnBy(pat);
  //  barr.jumpedOnBy(sponge);

  //display nasty patty class image 
  nasty.display();
  //move nasty patty class image
  nasty.move();
}




void keyPressed() {
  if (keyCode==' ') {
    sponge.jump();
  }
}


