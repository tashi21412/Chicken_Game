class FireObstacles {
  int x, y, fireHeight, fireWidth;
  float image_Num;
  PImage img;
  boolean out_of_frame;

  FireObstacles () {
    fireHeight = 120;
    fireWidth = 90;
    x = 480;
    y= 580 - fireHeight;
    image_Num = 0;
    out_of_frame = false;
  }

  void update() {
    if (!out_of_frame) {
      if (image_Num <  6) {
        img = loadImage("image/fire.png");
      } else if (image_Num < 12 ) {
        img = loadImage("image/fire1.png");
      } else if (image_Num < 18 ) {
        img = loadImage("image/fire2.png");
      } else if (image_Num < 24 ) {
        img = loadImage("image/fire3.png");
      } else if (image_Num < 30 ) {
        img = loadImage("image/fire4.png");
      } else if (image_Num < 36 ) {
        img = loadImage("image/fire5.png");
      }


      image(img, x, y, fireWidth, fireHeight);
      if (image_Num < 36 ) {
        image_Num+=2;
      } else {
        image_Num = 0;
      }
      x-=12;
      if (x <-96){
        out_of_frame = true;
      }
    }
  }
}
