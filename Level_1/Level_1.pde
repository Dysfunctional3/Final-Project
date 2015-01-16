PImage krustyKrab;
Barrel barr, barr2;
Patrick pat;
Spongebob sponge;


void setup() {
  size(1500, 577);
  krustyKrab = loadImage("krusty_krab_final.jpg");
  pat = new Patrick ();
  sponge = new Spongebob ();
  barr = new Barrel(width/2, height-75);
  barr2 = new Barrel(width/2+100, height-275);
  imageMode(CENTER);
}

void draw() {
  background(krustyKrab);

  //  pat.display();
  //  pat.move();

  sponge.display();
  sponge.move();
  sponge.landOnBarrel(barr);
  sponge.landOnBarrel(barr2);
  sponge.touchBarrel(barr);
  sponge.landOnBarrel(barr2);

  barr.display();
  barr2.display();
  //barr.jumpedOnBy(pat);
  //  barr.jumpedOnBy(sponge);
}

void keyPressed() {
  if (keyCode==' ') {
    sponge.jump();
  }
}

