import processing.sound.*;

Button button1;
Button button2;
Button button3;
PlayerCar player;
ArrayList<Lines> linesList;
FinishLine fLine;
Upgrades parts1;
Upgrades parts2;
Upgrades parts3;
Upgrades parts4;
SoundFile carSound;
SoundFile backgroundMusic;
Timer timer;
Stats stats;
Menu menu;
Animation carAnimation;
Coin coin;
PImage fLineImage;
PImage sLineImage;
PImage grass;

//arraylist

int state;
boolean reset;
PImage[] carImages = new PImage[2];

/*
this version accomplishes a few goals. i have the garage, race, and parts screen working
 for the most part. i have a finish line that stops the car and says you won and i have a function to increase car speed.
 the controls are ' ' to drive and 'e' to go back.
 i havent been able to get the speed to remain the same even after the race is stopped.
 yes this is prbly a hot mess :)
 */

void setup() {
  size(1000, 800);
  button1 = new Button(300);
  button2 = new Button(400);
  button3 = new Button(500);
  player = new PlayerCar();
  linesList = new ArrayList<Lines>();
  animation();
  fLine = new FinishLine();
  parts1 = new Upgrades(height/3, width/2);
  parts2 = new Upgrades(height/3+100, width/2);
  parts3 = new Upgrades(height/3, (width/2)-250);
  parts4 = new Upgrades(height/3+100, (width/2)-250);
  carSound = new SoundFile(this, "driving.mp3");
  backgroundMusic = new SoundFile(this, "fast_car_luke_combs.mp3");
  timer = new Timer();
  stats = new Stats();
  menu = new Menu(50);
  coin = new Coin();
  fLineImage = loadImage("finish0.png");
  sLineImage = loadImage("start0.png");
  grass = loadImage("grass0.png");
  state=0;
  grass.resize(width, height+200);
}

void draw() {
  background(45);

  levelHandler();

  carSound.rate(xSpeed/5);
  backgroundMusic.amp(.2);
}

void mousePressed() {


  if (button1.hitbox() == true) {
    state += 1;
    linesDraw();
    oppSpeed = int(random(5, maxSpeed+20));
    //animation();
    println("race");
    reset = false;
    win = false;
    lose = false;
    xF=10075;
    xS=xP+400;
    xO=width/5;
  }
  if (button2.hitbox() == true) {
    state += 2;
    println("garage");
  }
  if (button3.hitbox() == true) {
    state += 3;
    println("parts");
  }

  if (parts1.hitbox()==true && maxSpeed<=190 && coinValue>=1) {
    maxSpeed+=10;
    coinValue-=1;
  }
  if (parts2.hitbox()==true && accel<=0.25 && coinValue>=2) {
    accel+=0.050;
    coinValue-=2;
  }
  if (parts3.hitbox()==true && maxSpeed>10 && coinValue>0) {
    maxSpeed-=10;
    coinValue+=1;
  }
  if (parts4.hitbox()==true && accel>0.05 && coinValue>0) {
    accel-=0.050;
    coinValue+=2;
  }

  if (menu.hitbox() == true) {
    state=0;
    reset = true;
    startTime = millis();
    xSpeed=0;
    linesList.clear();
    xF=10075;
    xS=xP+100;
    xO=width/5;
    win = false;
    lose = false;
  }
}



void levelHandler() {
  //my finite state machine
  switch (state) {
    //level 1
  case 0:
    button1.render("race");
    button2.render("garage");
    button3.render("parts");

    if (state == 0 && !backgroundMusic.isPlaying()) {
      backgroundMusic.play();
    }
    fill(#B29D00);
    text("coins" + " " + coinValue, width/2, height/5);
    fill(255);
    text("last race time " + nf(seconds/1000) + "." + nf(milliSec), width-200, 100);

    if (win == true) {
      text("You won your last race here is 2 coins :)", width/2, (height/4)+25);
    }

    if (lose == true) {
      text("You lost your last race here is 1 coin :(", width/2, (height/4)+25);
    }

    state=0;
    reset = true;
    startTime = millis();
    xSpeed=0;
    linesList.clear();


    break;
    //level 2
  case 1:
    println("race");
    image(grass, width/2, height/2+25);
    //carAnimation.display(height*3/4, width/5);
    //animation();

    for (Lines activeLines : linesList) {
      activeLines.render();
      activeLines.move();
      activeLines.wallDetect();
    }

    fLine.render();
    fLine.move();
    fLine.winDetect();



    if (!carSound.isPlaying() && state == 1 && isDriving == true) {
      carSound.play();
      //carAnimation.isAnimating = true;
    }
    if (state == 1 && isDriving == false) {
      carSound.stop();
      if (xP<xS) {
        fill(255);
        textSize(100);
        text("press SPACE to drive", width/2, height/5-25);
        textSize(25);
        fill(255);
      }
    }

    if (state == 1) {
      backgroundMusic.stop();
    }

    player.renderPlayer(height*3/4, width/5);
    player.renderOpp(height/4);
    player.playerMove();
    player.moveOpp();

    timer.timerAction();

    menu.render();
    menu.hitbox();
    break;
    //level 3
  case 2:
    println("garage");
    player.renderPlayer(height/3, width/3);
    if (state == 2) {
      backgroundMusic.stop();
    }
    stats.render(width*3/4, height/3, 200, 300);

    menu.render();
    menu.hitbox();
    break;
    //level 4
  case 3:
    println("parts");
    parts1.render("+10 max speed", "-1 Coin");
    parts1.hitbox();
    parts2.render("+0.05 accel", "-2 Coins");
    parts2.hitbox();
    parts3.render("-10 max speed", "+1 Coin");
    parts3.hitbox();
    parts4.render("-0.05 accel", "+2 coins");
    parts4.hitbox();
    if (state == 3) {
      backgroundMusic.stop();
    }

    stats.render(width*4/5, height/3, 200, 300);

    menu.render();
    menu.hitbox();
    break;

  case 4:
    fLine.winDetect();

    menu.render();
    menu.hitbox();
    break;
  }
}



void linesDraw() {
  linesList.add(new Lines(200));
  linesList.add(new Lines(400));
  linesList.add(new Lines(600));
  linesList.add(new Lines(800));
  linesList.add(new Lines(1000));
  linesList.add(new Lines(1200));
}

void animation() {
  for (int i=0; i<carImages.length; i++) {
    carImages[i] = loadImage("car" + i + ".png");
  }
  carAnimation = new Animation(carImages, xSpeed/100, 0.3);
}
