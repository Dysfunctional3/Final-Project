//Level 2 Bucket System
class EnemySystem {
  int delay;
  int finalDelay;

  ArrayList <Bucket> buckets;

  EnemySystem() {
    buckets = new ArrayList<Bucket>();
    
    // make less buckets
    delay=0;
    finalDelay=10;
  }

  void addBucket() {
    if (delay==finalDelay) {
      buckets.add(new Bucket());
      delay=0;
    }
    delay++;
  }

  void run() {
    for (int i = buckets.size () - 1; i >=0; i--) {
      Bucket b = buckets.get(i);

      b.display();
      b.move();
      b.leave();
      b.hurtSponge(sponge);

      //if gone, remove buckets
      if (b.isGone()) {
        buckets.remove(i);
      }
    }
  }
}


