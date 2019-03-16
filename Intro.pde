class Intro{
  PImage wall, chicken,play_Button;
  int image_Num;
  boolean visible;
  Intro(){
  
    wall = loadImage("image/brickwall.jpeg"); 
    play_Button = loadImage("image/play_button.png");
    visible = true;
    image_Num = 0;
  }
  
  void update(){
    
    image(wall, 0,560);
    image(play_Button, width/2-100, height/3,200,100);
    if (image_Num <  30) {
         chicken=loadImage("image/closeEye.png"); 
      } 
    else if (image_Num < 120 ) {
        chicken=loadImage("image/openEye.png"); 
    }
    image(chicken, 120,410,150,150);
    
    if (image_Num <= 120 ) {
        image_Num+=2;
      } else {
        image_Num = 0;
      }
  }
}
