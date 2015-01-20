
float level;

//start screen
PImage startScreen;

//instruction screen
PImage instruScreen;
Nastyburger instruNasty;
Kelp instruKelp;
Hash instruHash;

//to get instruction page to work
boolean pressedOnce = false;

//declare level 1
PImage krustyKrab;
Barrel barr;
Barrel barr2;
Barrel barr3;
Spongebob sponge;
Nastyburger nasty;
Hash hss;

//transition screen
PImage transScreen;

//Krabby Patty
KPatty kp;


//declare level 2/boss level
PImage chumBucket;
EnemySystem en;

//winning end screen
PImage winScreen;

//losing end screen
PImage loseScreen;


void setup() {
  //apply to all levels
  size(1500, 577);
  imageMode(CENTER);
  textAlign(CENTER);

  //start with level 0 (start screen)
  level = 0;

  //initialize level 1
  krustyKrab = loadImage("krusty_krab_final.jpg");
  sponge = new Spongebob ();

  //barrels
  barr = new Barrel(200);
  barr2 = new Barrel(700);
  barr3 = new Barrel(1200);

  //obstacles
  nasty= new Nastyburger(width/2+100);
  hss = new Hash(width/4+100);

  //Transition Krabby Patties
  kp = new KPatty(width/2);

  //initialize level 2
  chumBucket = loadImage("chum_bucket.jpg");
  en = new EnemySystem();


  //initialize screens
  startScreen = loadImage("title screen.png");
  instruScreen = loadImage("instruction screen.png");
  transScreen = loadImage("transition screen.png");
  winScreen = loadImage("winner screen.png");
  loseScreen = loadImage("losing screen.png");

  //initialize instruction screen objects
  instruNasty = new Nastyburger(width/2 - 150);
  instruKelp = new Kelp(width/2, height-100);
  instruHash = new Hash(width/2 +150);
  
  //make instruction screen objects larger
  instruNasty.sz.mult(2);
  instruKelp.sz.mult(2);
  instruHash.sz.mult(1.5);
}

//to make it go to instruction screen after clicking
void mouseClicked() {
  if (!pressedOnce) {
    pressedOnce = true;
  } else if (pressedOnce) {
    pressedOnce = false;
  }
}


void draw() {

  //Level 0 -Start Screen and instruction screen
  if (level ==0) {

    //if mouse not clicked yet
    if (!pressedOnce) {
      //start screen picture
      background(startScreen);

      //make rectangle go under text for easier reading
      fill(255,75);
      noStroke();
      rect(520,451,460,31);
      //println(mouseX,mouseY);  // <--- used to find coordinates of rectangle above
      
      //show text
      textSize(30);
      fill(0);
      text("Click anywhere for instructions", width/2, 5*height/6);
    }

    //if already clicked once, show instruction screen
    if (pressedOnce) {
      //instruction page picture
      background(instruScreen);

      //obstacles shown
      instruNasty.loc.y = height-100;
      instruNasty.display();
      instruKelp.display();
      instruHash.loc.y = instruNasty.loc.y;
      instruHash.display();

      //make rectangle go under text for easier reading
      fill(255,75);
      noStroke();
      rect(610,546,283,25);
     // println(mouseX,mouseY);   //<--- used to find coordinates of rectangle above
      
      
      //show text
      textSize(25);
      fill(0);
      
      text("Click anywhere to play", width/2, height-10);

      //if clicked the second time, go to level 1
      if (mousePressed) {
        level = 1;
      }
    }
  }


  //Level 1 - Krusty Krab
  if (level == 1) {
    background(krustyKrab);

    //display "level 1"
    text("Level 1: The Krusty Krab", width/2, 30);

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

    //Spongebob's interaction with barrels
      if (sponge.loc.dist(barr3.loc) <= 200){
    sponge.landOnBarrel(barr3);
    sponge.touchBarrel(barr3);
        }

    //   if (sponge.loc.dist(barr.loc) <= sponge.sz.dist(barr.sz)){
      if (sponge.loc.dist(barr.loc) <= 200){
    sponge.landOnBarrel(barr);
    sponge.touchBarrel(barr);
      }

      if (sponge.loc.dist(barr2.loc) <= 200){
    sponge.landOnBarrel(barr2);
    sponge.touchBarrel(barr2);
      }


    //Nasties in Level 1
    nasty.display();
    nasty.move();
    nasty.bounceOffBarrels(barr2, barr3);
    nasty.hurtSponge(sponge);

    //  println(nasty.loc.x);   <-- for testing nasty
    
    //Hash Slinging Slasher
    hss.display();
    hss.move();
    hss.jump();
    hss.killSponge(sponge);

    //END OF LEVEL 1
    //if Spongebob reaches the end of the screen...
    if (sponge.loc.x > width - sponge.sz.x/2) {
      sponge.loc.x = sponge.sz.x/2;
      //change to transition
      level = 1.5;
    }
  }


  //Transition btwn Level 1 and 2
  if (level == 1.5) {
    //transition picture
    background(transScreen);   //<--- replace with transition

      //collect krabby patties
    ////////////////////////////////DOESN'T SHOW UP
    kp.run(sponge);

    //spongebob
    sponge.display();
    sponge.textDisplay();
    sponge.move();


    //if reaches the end of the screen, go to level 2
    if (sponge.loc.x > width - sponge.sz.x/2) {
      sponge.loc.x = sponge.sz.x/2;
      //change to transition slide
      level = 2;
    }
  }


  //Level 2 - Chum Bucket (Boss Level)
  if (level == 2) {
    background(chumBucket);

    //diplay "level 2"
    text("Level 2: The Chum Bucket", width/2, 30);

    //spongebob the same in all levels
    sponge.display();
    sponge.textDisplay();
    sponge.move();

    en.run();
    en.addBucket();

    if (sponge.loc.x > width - sponge.sz.x/2) {
      //go to end screen
      level = 2.5;
    }
  }


  //if Spongebob wins
  if (level == 2.5) {
    background(winScreen);
    //you win! background
    textSize(50);
    fill(0);
    text("Click anywhere to play again", width/2, height-150);    //<--- change location later
    if (mousePressed) {
      sponge.life = 10;
      sponge.loc.set(sponge.sz.x/2, height-sponge.sz.y/2);
      level = 1;
    }
  }


  //if Spongebob dies
  if (sponge.isDead()) {
    //add ending screen by changing background

      background(loseScreen);

    //text size subject to change
    textSize(50);   
    fill(255);
    text("Press 'r' to try again", width/2, height-200);

    if (keyPressed) { 
      if (key == 'r') {    
        //reset life
        sponge.life = 10;  
        sponge.loc.set(sponge.sz.x/2, height-sponge.sz.y/2);

        //restarts back to level 1
        level = 1;
      }
    }
  }
}




//if spacebar pressed, jump
void keyPressed() {
  if (keyCode==' ') {
    sponge.jump();
  }
}

