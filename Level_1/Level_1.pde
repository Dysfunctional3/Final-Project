PImage krustyKrab;
Barrel barr;
Barrel barr2;
Barrel barr3;
//Patrick pat;
Spongebob sponge;
Nastyburger nasty;


void setup() {
  size(1500, 577);
  krustyKrab = loadImage("krusty_krab_final.jpg");
  //  pat = new Patrick ();
  sponge = new Spongebob ();

  barr = new Barrel(200);
  barr2 = new Barrel(600);
  barr3 = new Barrel(1200);

  nasty= new Nastyburger(width/2+100);
  imageMode(CENTER);
}

void draw() {
  background(krustyKrab);

  //  pat.display();
  //  pat.move();

  if (keyCode==' ') {
    sponge.jump();
  }

    sponge.move();
    sponge.display();


    sponge.landOnBarrel(barr3);
    sponge.touchBarrel(barr3);

    sponge.landOnBarrel(barr);
    sponge.touchBarrel(barr);

    sponge.landOnBarrel(barr2);
    sponge.touchBarrel(barr2);



    barr.display();
    barr2.display();
    barr3.display();

    //display nasty patty class image 
    nasty.display();
    //move nasty patty class image
    nasty.move();

    nasty.bounceOffBarrels(barr, barr3);

    //  println(nasty.loc.x);   <-- for testing nasty

    if (sponge.isDead()) {
      //
    }
  }





  /*void keyPressed() {
   if (keyCode==' ') {
   sponge.jump();
   }
   }
   */

