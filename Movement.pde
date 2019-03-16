

class Movement { 
  PImage img;
  int image_Num, x, xPosition, y, mHeight, mWidth, slide_Frame_Counter ;
  boolean maxJump;
  State state;
 


  Movement(State state) {
    this.state = state;
    image_Num = 0;
    slide_Frame_Counter = 0;
    x = -13;
    xPosition = 100;
    y = 430;
    mHeight= 150;
    mWidth =150;
    maxJump = false;
  }


  void update() { 

    switch (this.state) {

    case JUMPING:
      if (y>250 && maxJump == false){
        x++;
        img = loadImage("image/chicken6.png");
        y= x * x;
       // y= y/8;
        y= -1*(y + 250);
        if (y<=250){
          maxJump = true;
          img = loadImage("image/chicken7.png");
        }
        
        
      }
      else if ( maxJump == true){
        x++;
        img = loadImage("image/chicken8.png");
        y= x * x;
        //y= y/8;
        y= 1*(y + 250);
        if (y > 430){
          this.state = ChickenGame.State.RUNNING;
          maxJump = false;
          y=430;
          x=-13;
        }
        
      }
      break;
      
    case SLIDING:
      slide_Frame_Counter++;
      img = loadImage("image/slide/slide1.png");
      if (slide_Frame_Counter > 90){
        this.state = ChickenGame.State.RUNNING;
        slide_Frame_Counter = 0;
      }
      
      break;
      
      
    default:
      if (image_Num <  6) {
        img = loadImage("image/chicken1.png");
      } else if (image_Num < 12 ) {
        img = loadImage("image/chicken2.png");
      } else if (image_Num < 18 ) {
        img = loadImage("image/chicken3.png");
      } else if (image_Num < 24 ) {
        img = loadImage("image/chicken4.png");
      } else if (image_Num < 30 ) {
        img = loadImage("image/chicken5.png");
      } else if (image_Num < 36 ) {
        img = loadImage("image/chicken.png");
      }

      
      break;
    }
    
    image(img, xPosition, y, mWidth, mHeight);

      if (image_Num < 36 ) {
        image_Num+=2;
      } else {
        image_Num = 0;
      }
  }
}
