////////////////////////////////////////
////////////////////////////////////////
/////////    SUPER SPONGEBOB    ////////
////////////////////////////////////////
////////////////////////////////////////


//declare

float level;

//START SCREEN
PImage startScreen;

//INSTRUCTION SCREEN

PImage instruScreen;

//"avoid" these
Nastyburger instruNasty;
Kelp instruKelp;
Hash instruHash;

//to get instruction page to work
boolean pressedOnce = false;


//LEVEL 1

//background
PImage krustyKrab;

//barrels
Barrel barr;
Barrel barr2;
Barrel barr3;

//patties above barrels
KPatty kP;
KPatty kP2;
KPatty kP3;

//Spongebob
Spongebob sponge;

//obstacles
Nastyburger nasty;
Nastyburger nasty2;
Hash hss;


//TRANSITION SCREEN

//background
PImage transScreen;

//shooting krabby patties
KPSystem kpSys;

//LEVEL 2

PImage chumBucket;

//formula
Formula form;

//bucket system
EnemySystem en;

//WINNING SCREEN
PImage winScreen;

//LOSING SCREEN
PImage loseScreen;


void setup() {
  //initialize

  //apply to all levels
  size(1500, 577);
  imageMode(CENTER);
  textAlign(CENTER);

  //start with level 0 (start screen)
  level = 0;

  //LEVEL 1
  krustyKrab = loadImage("krusty_krab_final.jpg");
  sponge = new Spongebob ();

  //barrels
  barr = new Barrel(200);
  barr2 = new Barrel(650);
  barr3 = new Barrel(1300);

  //patties above barrels
  kP = new KPatty();
  kP2 = new KPatty();
  kP3 = new KPatty();

  //obstacles
  nasty= new Nastyburger(width/2+200);
  nasty2= new Nastyburger(width-400);
  hss = new Hash(width/4+50);

  //Transition Krabby Patties
  kpSys = new KPSystem();

  //LEVEL 2
  chumBucket = loadImage("chum_bucket.jpg");
  
  en = new EnemySystem();
  
  form = new Formula();


  //initialize screens
  startScreen = loadImage("title screen.png");
  instruScreen = loadImage("instruction screen.png");
  transScreen = loadImage("transition screen.png");
  winScreen = loadImage("winner screen.png");
  loseScreen = loadImage("losing screen.png");

  //ISNTRUCTION PAGE

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

  //LEVEL 0 -Start Screen and instruction screen
  if (level ==0) {

    //if mouse not clicked yet...
    if (!pressedOnce) {
      //start screen picture
      background(startScreen);

      //make rectangle go under text for easier reading
      fill(255, 75);
      noStroke();
      rect(520, 451, 460, 31);
      // println(mouseX,mouseY);   //<--- used to find coordinates of rectangle above

      //show text
      textSize(30);
      fill(0);
      text("Click anywhere for instructions", width/2, 5*height/6);
    }

    //if clicked once, show instruction screen
    if (pressedOnce) {
      //instruction page picture
      background(instruScreen);

      //obstacles shown

        instruNasty.loc.y = height-100;   //location
      instruHash.loc.y = instruNasty.loc.y;   //location

      //display
      instruNasty.display();
      instruKelp.display();
      instruHash.display();

      //make rectangle go under text for easier reading
      fill(255, 75);
      noStroke();
      rect(610, 546, 283, 25);
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


  //LEVEL 1 - Krusty Krab
  if (level == 1) {
    //set background
    background(krustyKrab);

    fill(0, 255, 0);

    //display "level 1"
    text("Level 1: The Krusty Krab", width/2, 30);

    //Spongebob (in every level)
    sponge.textDisplay();
    sponge.move();
    sponge.display();

    //barrels in level 1

    //display
    barr.display();
    barr2.display();
    barr3.display();

    //kelp kills spongebob
    barr.deathByKelp(sponge);
    barr2.deathByKelp(sponge);
    barr3.deathByKelp(sponge);

    //patties in level 1

    //patty 1
    if (!kP.isGone()) {
      kP.changeLoc(200, 350);
      kP.run(sponge);
    } else {
      // if KP dead, get off screen
      kP.loc.x = -kP.sz.x/2;
      kP.kpDead = true;
    }

    //patty 2
    if (!kP2.isGone()) {
      kP2.changeLoc(650, 350);
      kP2.run(sponge);
    } else {
      // if KP dead, get off screen
      kP2.loc.x = -kP2.sz.x/2;
      kP2.kpDead = true;
    }

    //patty 3
    if (!kP3.isGone()) {
      kP3.changeLoc(1300, 350);
      kP3.run(sponge);
    } else {
      // if KP dead, get off screen
      kP3.loc.x = -kP3.sz.x/2;
      kP3.kpDead = true;
    }


    //Spongebob's interaction with barrels

    //barrel 1
    if (sponge.loc.dist(barr.loc) <= 200) {
      sponge.landOnBarrel(barr);
      sponge.touchBarrel(barr);
    }

    //barrel 2
    if (sponge.loc.dist(barr2.loc) <= 200) {
      sponge.landOnBarrel(barr2);
      sponge.touchBarrel(barr2);
    }

    //barrel 3
    if (sponge.loc.dist(barr3.loc) <= 200) {
      sponge.landOnBarrel(barr3);
      sponge.touchBarrel(barr3);
    }


    //Nasties in Level 1

    //nasty 1
    nasty.display();
    nasty.move();
    nasty.bounceOffBarrels(barr2, barr3);
    nasty.hurtSponge(sponge);

    //nasty 2
    nasty2.display();
    nasty2.move();
    nasty2.bounceOffBarrels(barr2, barr3);
    nasty2.hurtSponge(sponge);

        //  println(nasty.loc.x);   <-- for testing nasty

    //Hash Slinging Slasher
    hss.display();
    hss.move();
    hss.jump();
    hss.killSponge(sponge);

    //end of level 1

    //if Spongebob reaches the end of the screen...
    if (sponge.loc.x > width - sponge.sz.x/2) {

      //set back to lower left corner
      sponge.loc.x = sponge.sz.x/2;

      //change to transition screen
      level = 1.5;
    }
  }


  //TRANSITION between Level 1 and 2
  if (level == 1.5) {
    //transition picture
    background(transScreen);   //<--- replace with transition

    //Krabby Patty system for extra lives
    kpSys.run();
    kpSys.addKP();

    //Spongebob
    sponge.display();
    sponge.textDisplay();
    sponge.move();

    //if reaches the end of the screen, go to level 2
    if (sponge.loc.x > width - sponge.sz.x/2) {

      //set location back to lower left corner
      sponge.loc.x = sponge.sz.x/2;

      //change to level 2
      level = 2;
    }
  }


  //LEVEL 2 - Chum Bucket (Boss Level)
  if (level == 2) {
    //background set
    background(chumBucket);

    fill(255, 0, 0);

    //diplay "level 2"
    text("Level 2: The Chum Bucket", width/2, 30);

    //spongebob
    sponge.display();
    sponge.textDisplay();
    sponge.move();

    //bucket system
    en.run();
    en.addBucket();
    
    //formula
    form.display();
    form.winGame(sponge);

    //if spongebob reaches the right side of screen
    if (sponge.loc.x > width - sponge.sz.x/2) {
       sponge.loc.x= width-sponge.sz.x/2;
    }
  }


  //if Spongebob wins
  if (level == 2.5) {

    //you win! background
    background(winScreen);

    //text
    textSize(50);
    fill(0,150,255);
    text("Click anywhere to play again", width/2, height-100);

    //press mouse to play again
    if (mousePressed) {

      //reset life
      sponge.life = 10;

      //set location back to start
      sponge.loc.set(sponge.sz.x/2, height-sponge.sz.y/2);

      //reset level 1 patties
      if (kP.isGone()) {
        kP.kpDead = false;
      }
      if (kP2.isGone()) {
        kP2.kpDead = false;
      }
      if (kP3.isGone()) {
        kP3.kpDead = false;
      }

      //restart
      level = 0;
    }
  }


  //if Spongebob dies
  if (sponge.isDead()) {
    //losing screen background
      background(loseScreen);

    //text size subject to change
    textSize(50);   
    fill(255);
    text("Press 'r' to try again", width/2, height-100);

    if (keyPressed) { 
      //if r pressed
      if (key == 'r') {    
        //reset life
        sponge.life = 10;  

        //set location back to start
        sponge.loc.set(sponge.sz.x/2, height-sponge.sz.y/2);

        //reset level 1 patties
        if (kP.isGone()) {
          kP.kpDead = false;
        }
        if (kP2.isGone()) {
          kP2.kpDead = false;
        }
        if (kP3.isGone()) {
          kP3.kpDead = false;
        }

        //restart
        level = 0;
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

