class Dead{
  PImage deadChicken, wall, retry;
  boolean visible;
  int x, y;
  
  Dead(){
    x = y = 0;
    wall = loadImage("image/brickwall.jpeg"); 
    deadChicken =loadImage("image/chicken9.png");
    retry = loadImage("image/retry.png");
    
    visible = false;
  }
  
  void update(){
    image(wall, 0,560);
    image(deadChicken,x,y,150,150);
    image(retry,width/2-50, height/3,100,100);
  }
}
