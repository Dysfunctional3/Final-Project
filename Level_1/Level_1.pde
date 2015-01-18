PImage krustyKrab;
Barrel barr;
Barrel barr2;
//Patrick pat;
Spongebob sponge;
Nastyburger nasty;


void setup() {
  size(1500, 577);
  krustyKrab = loadImage("krusty_krab_final.jpg");
  //  pat = new Patrick ();
  sponge = new Spongebob ();
  barr = new Barrel(200);
  barr2 = new Barrel(1000);
  nasty= new Nastyburger(width/2);
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
  
  sponge.landOnBarrel(barr2);
  sponge.touchBarrel(barr2);

  barr.display();
  barr2.display();

  //display nasty patty class image 
  nasty.display();
  //move nasty patty class image
  nasty.move();
  
  nasty.bounceOffBarrels(barr,barr2);
  
//  println(nasty.loc.x);   <-- for testing nasty
}




void keyPressed() {
  if (keyCode==' ') {
    sponge.jump();
  }
}


