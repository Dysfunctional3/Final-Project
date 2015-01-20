//Krabby Patty System
//LATER: make this

//Transition Krabby Patty System
class KPSystem {
  int delay;
  int finalDelay;

  ArrayList <KPatty> kp;

  KPSystem() {
    kp = new ArrayList<KPatty>();
    
    // make less buckets
    delay=0;
    finalDelay=200;
  }

  void addKP() {
    if (delay==finalDelay) {
      kp.add(new KPatty());
      delay=0;
    }
    delay++;
  }

  void run() {
    for (int i = kp.size () - 1; i >=0; i--) {
      
      KPatty k = kp.get(i);

      k.run(sponge);
      k.move();

      //if gone, remove buckets
      if (k.isGone()) {
        kp.remove(i);
      }
    }
  }
}

