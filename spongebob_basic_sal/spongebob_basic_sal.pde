Spongebob sponge;
void setup() {
  size(800, 600);
  sponge= new Spongebob();
}
void draw() {
  background(0);
  sponge.display();
  sponge.move();
  sponge.jump();
}

