class BrickWall {
  PImage wall1;
  PImage wall2;
  int movement;
  BrickWall() {
    movement = 0;
  }


  void update () {

    wall1= loadImage("image/brickwall.jpeg");
    wall2= loadImage("image/brickwall.jpeg");
    image(wall1, movement,560);
    image(wall1, movement+424,560);
    
    
    if (movement >-424){
      movement = movement-6;
    }
    
    else {
      movement =0;
    }
    
  }
}
