PImage krustyKrab;
Barrel barr;
Patrick pat;


void setup() {
  size(1500, 577);
  krustyKrab = loadImage("krusty_krab_final.jpg");
  pat = new Patrick ();
  barr = new Barrel();
  imageMode(CENTER);
}

void draw() {
  background(krustyKrab);

  pat.display();
  pat.move();
  pat.jump();

  barr.display();
  barr.jumpedOnBy(pat);
}

