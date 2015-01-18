//Level 2 Bucket System

class EnemySystem{
  
 ArrayList <Bucket> buckets;
  
  EnemySystem(){
    buckets = new ArrayList<Bucket>();
    
  }
  
  void addBucket(){
    buckets.add(new Bucket());
  }
  
  void run(){
    for (int i = buckets.size() - 1; i >=0; i--){
      Bucket b = buckets.get(i);
      
      b.display();
      b.move();
      b.leave();
      b.hurtSponge(sponge);
      
      //if gone, remove buckets
      if (b.isGone()){
        buckets.remove(i);
      }
      
    }
  }
  
  
}
