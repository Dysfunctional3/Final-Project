Nastyburger nasty;
void setup(){
 size(800,600);
nasty= new Nastyburger();

}
void draw(){
background(0);
nasty.display();
nasty.move();
}
