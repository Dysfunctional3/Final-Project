
float level;

//declare level 1
PImage krustyKrab;
Barrel barr;
Barrel barr2;
Barrel barr3;
//Patrick pat;
Spongebob sponge;
Nastyburger nasty;

//declare level 2/boss level
PImage chumBucket;
EnemySystem en;

//to get instruction page to work
//fixxxxxxx
boolean pressedTwice = false;


void setup() {
  //apply to all levels
  size(1500, 577);
  imageMode(CENTER);
  textAlign(CENTER);

  level = 0;

  //initialize level 1

  krustyKrab = loadImage("krusty_krab_final.jpg");
  //  pat = new Patrick ();
  sponge = new Spongebob ();

  barr = new Barrel(200);
  barr2 = new Barrel(600);
  barr3 = new Barrel(1200);

  nasty= new Nastyburger(width/2+100);

  //initialize level 2
  chumBucket = loadImage("chum_bucket.jpg");
  en = new EnemySystem();
  
}

void draw() {

  //Level 0 -Start Screen
  if (level ==0) {
    //start screen picture
    background(0);   //<--- replace with image
    
    textSize(50);
    text("Click to start", width/2, height/2);
    if (!pressedTwice){
    if (mousePressed) {
      level = .5;
      pressedTwice = true;
    }
    }
  }
  
  //instruction page
  if (level == .5){
    background(100);
    
    textSize(50);
    text("Click again",width/2,height/2);
    if (pressedTwice){
      if (mousePressed){
        level = 1;
      }
    }
  }


  //Level 1 - Krusty Krab
  if (level == 1) {
    background(krustyKrab);

    //patrick if only we have time to make another character
    //  pat.display();
    //  pat.move();

    /*    if (keyCode==' ') {
     sponge.jump();
     }  */

    //applies to all levels, but need to be written after background, so copy and paste
    sponge.textDisplay();
    sponge.move();
    sponge.display();

    //barrels in level 1
    barr.display();
    barr2.display();
    barr3.display();
    barr.deathByKelp(sponge);
    barr2.deathByKelp(sponge);
    barr3.deathByKelp(sponge);

    //Spongebob's interaction (NEED TOP FIX JUMPING ON BARREL)
 //   if (sponge.loc.dist(barr3.loc) <= sponge.sz.dist(barr3.sz)){
    sponge.landOnBarrel(barr3);
    sponge.touchBarrel(barr3);
 //   }
    
 //   if (sponge.loc.dist(barr.loc) <= sponge.sz.dist(barr.sz)){
    sponge.landOnBarrel(barr);
    sponge.touchBarrel(barr);
 //   }

    //for some reason, only this last function jumps on barrel
  //  if (sponge.loc.dist(barr3.loc) <= sponge.sz.dist(barr2.sz)){
    sponge.landOnBarrel(barr2);
    sponge.touchBarrel(barr2);
  //  }


    //Nasties in Level 1
    nasty.display();
    nasty.move();
    nasty.bounceOffBarrels(barr2, barr3);
    nasty.hurtSponge(sponge);

    //  println(nasty.loc.x);   <-- for testing nasty

    //END OF LEVEL 1
    //if Spongebob reaches the end of the screen...
    if (sponge.loc.x > width) {
      sponge.loc.x = sponge.sz.x/2;
      //change to transition slide
      level = 1.5;
    }
  }


  //Level 1.5 - Transition btwn Level 1 and 2
  
  if (level == 1.5) {
    //transition picture
        background(0);   //<--- replace with transition

   //click to move onto Level 2 (Boss)
   textSize(50);
    text("Click to continue", width/2, height/2);    //<--- change location later
    if (mousePressed) {
      level = 2;
    }
  }


  //Level 2 - Chum Bucket (Boss Level)
  if (level == 2) {
    background(chumBucket);
    //spongebob the same in all levels
    sponge.display();
    sponge.textDisplay();
    sponge.move();
    
    //LATER: why is spongebob not showing up in Level 2?
   // sponge.display();
    
    //I'll fix this later. I need at least three hours of sleep.
    en.run();
    en.addBucket();
    
    
  }


  //if Spongebob dies
  if (sponge.isDead()) {
    //add ending screen by changing background

      //background(

    //text size subject to change
    textSize(50);   
    text("Press 'r' to try again", width/2, height/2);

    if (keyPressed) { 
      if (key == 'r') {      
        //restarts back to level 1
        level = 1;
        //resets life
        sponge.life = 10;
      }
    }
  }
}




void keyPressed() {
  if (keyCode==' ') {
    sponge.jump();
  }
}

