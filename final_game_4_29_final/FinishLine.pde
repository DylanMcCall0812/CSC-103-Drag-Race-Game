float xSpeed=10;
boolean isDriving = false;
float xF;
float xS;
boolean win;
boolean lose;


class FinishLine {
  int w;
  int y;
  int h;

  FinishLine() {
    y=height/2;
    w=100;
    h=10;
    xSpeed=10;
    xF=10075;
    xS=xP+100;
  }
  void render() {
    imageMode(CENTER);
    fill(255);
    image(fLineImage, xF, y);
    //println(xF);
    image(sLineImage, xS, y);
  }

  void move() {
    if (isDriving == true && xSpeed<=maxSpeed) {
      xSpeed+=accel;
    } else {
      xSpeed *= 0.98;
      xSpeed = max(0, xSpeed);
    }
    xF-=xSpeed;
    xS-=xSpeed;
  }

  void winDetect() {
    //if (xP >= xF && xO <= xF) {
    //  text("you win!", width/2, height/3);
    //}
    //if (xO >= xF && xP <= xF){
    //  text("you lose :(", width/2, height/3);
    //}
    if (xO >= xF && reset == false && win == false) {
      lose = true;
      text("you lose :(", width/2, height/3);
      coinValue+=1;
      state=0;
    }
    if (xP>= xF && reset == false && lose == false) {
      win = true;
      text("you win!", width/2, height/3);
      coinValue+=2;
      state=0;
    }
    println(reset);
  }
  //////////////////////////////////////////
}
