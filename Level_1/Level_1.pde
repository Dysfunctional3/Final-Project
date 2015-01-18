int level;

PImage krustyKrab;
Barrel barr;
Barrel barr2;
Barrel barr3;
//Patrick pat;
Spongebob sponge;
Nastyburger nasty;


void setup() {
  //apply to all levels
  size(1500, 577);
  imageMode(CENTER);
  textAlign(CENTER);
  
    krustyKrab = loadImage("krusty_krab_final.jpg");
  //  pat = new Patrick ();
  sponge = new Spongebob ();

  barr = new Barrel(200);
  barr2 = new Barrel(600);
  barr3 = new Barrel(1200);

  nasty= new Nastyburger(width/2+100);
  }

}

void draw() {
  background(krustyKrab);

  //  pat.display();
  //  pat.move();

  if (keyCode==' ') {
    sponge.jump();
  }

  sponge.textDisplay();

    sponge.move();
    sponge.display();
    
    barr.display();
    barr2.display();
    barr3.display();
    barr.deathByKelp(sponge);
    barr2.deathByKelp(sponge);
    barr3.deathByKelp(sponge);


    sponge.landOnBarrel(barr3);
    sponge.touchBarrel(barr3);

    sponge.landOnBarrel(barr);
    sponge.touchBarrel(barr);

//for some reason, only this last function jumps on barrel
    sponge.landOnBarrel(barr2);
    sponge.touchBarrel(barr2);


    //display nasty patty class image 
    nasty.display();
    //move nasty patty class image
    nasty.move();

    nasty.bounceOffBarrels(barr, barr3);
    
    nasty.hurtSponge(sponge);

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

