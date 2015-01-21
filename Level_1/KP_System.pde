//TRANSITION KRABBY PATTY SYSTEM

class KPSystem {
  //delay for when the krabby patties appear
  int delay;
  int finalDelay;

  //arraylist for KPatties
  ArrayList <KPatty> kp;

  KPSystem() {
    //initialize variables

    kp = new ArrayList<KPatty>();

    //initialize values
    delay=0;

    //after how many frames does delay reach final delay?
    finalDelay=180;
  }

  //add Krabby Patties
  void addKP() {
    if (delay==finalDelay) {
      kp.add(new KPatty());
      delay=0;
    }
    delay++;
  }

  //run the system
  void run() {
    for (int i = kp.size () - 1; i >=0; i--) {

      KPatty k = kp.get(i);

      k.leave();
      k.run(sponge);
      k.move();

      //if gone, remove krabby patties
      if (k.isGone()) {
        kp.remove(i);
      }
    }
  }
}

