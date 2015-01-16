Nastyburger nasty;
void setup(){
  
 size(800,600);
nasty= new Nastyburger();
imageMode(CENTER);

}
void draw(){
background(0);
nasty.display();
nasty.move();
}
