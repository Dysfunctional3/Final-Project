PImage krustyKrab;
Barrel barr;
Patrick pat;
Spongebob sponge;


void setup() {
  size(1500, 577);
  krustyKrab = loadImage("krusty_krab_final.jpg");
  pat = new Patrick ();
  sponge = new Spongebob ();
  barr = new Barrel();
  imageMode(CENTER);
}

void draw() {
  background(krustyKrab);

//  pat.display();
//  pat.move();

    sponge.display();
    sponge.move();
    sponge.landOnBarrel(barr);

  barr.display();
  //barr.jumpedOnBy(pat);
//  barr.jumpedOnBy(sponge);
}

void keyPressed(){
  if(keyCode==' '){
       sponge.jump(); 
}
}
