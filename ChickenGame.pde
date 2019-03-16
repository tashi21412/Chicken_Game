import processing.sound.*;


// Declare and construct two objects (h1, h2) from the class HLine 
PImage img, playPause, house;
boolean pause;
int score;
SoundFile background_music;
static enum State
{ 
  SLIDING, 
    JUMPING, 
    RUNNING
}
static enum FrameState
{
  START, 
    PLAYING, 
    DEAD
}

Intro intro;
Dead dead;
Movement move = new Movement(State.RUNNING);
BrickWall brickwall = new BrickWall();    
State state = State.RUNNING;
ObstacleAndEggManager ob_Manager ;
static FrameState frameState;



void setup() 
{        
  size(480, 800);
  frameRate(60);
  //Music
 // background_music = new SoundFile(this, "sound/background.mp3");
  
  //SELF CREATED OBJECTS

  move = new Movement(State.RUNNING);
  ob_Manager = new ObstacleAndEggManager(move);
  intro = new Intro();
  dead = new Dead();



  img = loadImage("image/background.png");
  house = loadImage("image/city.png");
  playPause = loadImage ("image/pause.png");
  pause = false;
  frameState = frameState.START;
}

void draw() { 
  background(131, 224, 235);
  image(img, 50, 0, 200, 110 );
  image(house,0,0);
  

  switch (frameState) {

  case PLAYING:
    score++; 
    
    textSize(50);
    text(score, width/2-40, height/4); 
    
    move.update();
    brickwall.update();
    ob_Manager.update();
    image(playPause, 180, (height*7)/8, 80, 80);
    break;



  case DEAD:
    score = 0;
    dead.x = move.xPosition;
    dead.y = move.y;
    dead.update();
    dead.visible=true;
    //println(ob_Manager.seconds);
    //noLoop();
    break;



  default:
    intro.update();

    break;
  }
} 
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP && move.y + move.mHeight > 540) {
      move.state = State.JUMPING;
      
    } else if (keyCode == DOWN && move.y + move.mHeight > 540) {
      move.state = State.SLIDING;
    } 
  }
  
}   
void mousePressed() {
  if (mouseX > width/2-100 && mouseX < width/2 +100 && mouseY > height/3 && mouseY < height/3+100 && intro.visible) {
    frameState = frameState.PLAYING;
    intro.visible=false;
   
  } else  if (mouseX > width/2-100 && mouseX < width/2 +100 && mouseY > height/3 && mouseY < height/3+100 && dead.visible) {
    frameState = frameState.START;
    intro.visible=true;
    dead.visible=false;

    move = new Movement(State.RUNNING);
    ob_Manager = new ObstacleAndEggManager(move);
    intro = new Intro();
    dead = new Dead();
  } else if (mouseX > 180 && mouseX < 260 && mouseY > (height*7)/8 && mouseY < (height*7)/8 +80) {

    if (pause) {
      playPause = loadImage ("image/pause.png");
      image(playPause, 180, (height*7)/8, 80, 80);
      loop();
      pause = false;
    } else if (!pause) {
      playPause = loadImage ("image/play.png");
      image(playPause, 180, (height*7)/8, 80, 80);
      noLoop();
      pause = true;
    }
  }
}
