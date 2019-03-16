class ObstacleAndEggManager {
  FireObstacles fireObstacle;
  Egg egg;
  int seconds, delay;  //depended on frame

  Movement move;

  ObstacleAndEggManager(Movement move) {
    this.move = move;
    fireObstacle = new FireObstacles();
    egg = new Egg();
    delay = 0;
  }

  void update () {

    if (delay > 120){
      if (seconds==300) {
        fireObstacle = new FireObstacles();
        egg = new Egg();
      }
      fireObstacle.update();
      egg.update();
      collision();
  
      seconds++;
      if (seconds > 300) {
        seconds=0;
      }
      delay = 121;
    }  
    delay++;
  }

  void collision() {
    if (move.xPosition + move.mWidth-40 >= egg.x && move.y < egg.y +egg.egg_height) {
      egg.show = false;
    }
    //fireHeight = 120;
    //   fireWidth = 90;
    //   x = 480;
    //   y= 580 - fireHeight;

    //   xPosition = 100;
    //   y = 430;
    //   mHeight= mWidth =150;


    else if ((move.y + move.mHeight >= fireObstacle.y
      && move.y + move.mHeight < fireObstacle.y + fireObstacle.fireHeight 
      && move.xPosition < (fireObstacle.x /**+ fireObstacle.fireWidth-100*/) && move.xPosition > fireObstacle.x)//right of the right
      ||
      (move.y + move.mHeight >= fireObstacle.y
      && move.y + move.mHeight < fireObstacle.y + fireObstacle.fireHeight 
      && move.xPosition < fireObstacle.x && move.xPosition + move.mWidth > (fireObstacle.x +50) )//left of fire
      || (move.xPosition < fireObstacle.x  && move.xPosition + move.mWidth > fireObstacle.x +40  && move.y +30 >= fireObstacle.y))
    {
      print ("Chicken X: ");
      println(move.xPosition);
      print ("Chicken Y: ");
      println(move.y);
      print("Fire X:");
      println(fireObstacle.x);
      print("Fire Y:");
      println(fireObstacle.y);
      println( move.y + move.mHeight );
      println ("fireObstacle.y "+ fireObstacle.y);
      println (fireObstacle.y + fireObstacle.fireHeight);
      println (move.xPosition + move.mWidth);
      println(fireObstacle.x+40);
      //noLoop();
      ChickenGame.frameState = ChickenGame.frameState.DEAD;

      print("hit");
    }
  }
}
