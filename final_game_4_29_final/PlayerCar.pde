int xP;
int xO;
float oppSpeed;

class PlayerCar {

  int wP;
  int hP;
  int wO;
  int hO;
  int xSpeed;
  int w;
  int x;

  PlayerCar() {
    xP = width/5;
    wP = 50;
    hP = 50;
    xO = width/5;
    wO = 50;
    hO = 50;
    xSpeed = 10;
    w = 100;
    x = 200;
  }

  void renderPlayer(int yP, int xP) {
    rectMode(CENTER);
    imageMode(CENTER);
    fill(color(0));
    //rect(xP, yP, wP, hP);
    carAnimation.display(xP, yP);
  }

  void renderOpp(int yO) {
    rectMode(CENTER);
    imageMode(CENTER);
    fill(color(0));
    //rect(xO, yO, wO, hO);
    carAnimation.display(xO, yO);
  }

  void playerMove() {
    if (keyPressed == true) {
      if (key==' ') {
        isDriving=true;
        if (!carSound.isPlaying()) {
          carSound.play();
        }
      }
    } else {
      isDriving=false;
    }
  }

  void moveOpp() {
    float oppMaxSpeed = 5;
    float oppAccel = accel;

    // if (isDriving == true && oppSpeed<=oppMaxSpeed) {
    //  oppSpeed+=oppAccel;
    //} else {
    //  oppSpeed *= 0.98;
    //  oppSpeed = max(0, xSpeed);
    //}


    if (oppSpeed<=maxSpeed && isDriving == true) {
      xO-=oppSpeed/4;
      carAnimation.isAnimating = true;
    }
    if (oppSpeed>=maxSpeed && isDriving == true) {
      xO+=oppSpeed/4;
      carAnimation.isAnimating = true;
    }
    println(maxSpeed);
  }


  /////////////////
}
