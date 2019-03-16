class Egg {
  int x, y, egg_height, egg_width;
  float tintOffset;
  boolean show;
  PImage img;

  Egg() {

    this.x=480;
    this.y=280;
    this.tintOffset =200;
    this.egg_height = 65;
    this.egg_width = 50;
    this.show = true;
  }

  void update() {

    if (x >= -200 && this.show==true) {
      img = loadImage("image/egg.png");
      //noTint();
      image(img, x, y, this.egg_width, this.egg_height);


      x-=5;
    } else if (tintOffset > 0.00000000000000001 && this.show==false) {
      img = loadImage("image/score1.png");
      if (y <260) {
        tint(255, tintOffset);
        tintOffset = tintOffset/2 ;
      }
      image(img, x, y, this.egg_width, this.egg_height);
      noTint();

      y-=5;
    }
  }
}
