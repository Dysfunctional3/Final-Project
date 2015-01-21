//LEVEL 2 BUCKET SYSTEM

class EnemySystem {
  //delay to time the buckets
  int delay;
  int finalDelay;

  //make arraylist of buckets
  ArrayList <Bucket> buckets;

  EnemySystem() {
    //initialize variables

    buckets = new ArrayList<Bucket>();

    // make less buckets
    delay=0;
    finalDelay=10;
  }

  //add buckets on screen
  void addBucket() {
    if (delay==finalDelay) {
      buckets.add(new Bucket());
      delay=0;
    }
    delay++;
  }

  //run the system
  void run() {
    for (int i = buckets.size () - 1; i >=0; i--) {

      Bucket b = buckets.get(i);

      b.display();
      b.move();
      b.leave();
      b.hurtSponge(sponge);

      //if dead, remove buckets
      if (b.isGone()) {
        buckets.remove(i);
      }
    }
  }
}

