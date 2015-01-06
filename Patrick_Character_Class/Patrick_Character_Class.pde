class Patrick{
//declare
PImage patrick;
PVector patsz;

Patrick(){
  //initialize
  patrick = loadImage("patrick.png");
  patsz = new PVector(74,100);
}

//display image
void display(){
  //set mouse at center of image
  image(patrick,mouseX-patsz.x/2,mouseY-patsz.y/2);
}

void jump(){
  
}

void die(){
  
}


}
