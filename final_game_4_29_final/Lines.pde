float accel=0.050;
int maxSpeed=10;

class Lines {
  float x;
  int w;
  int y;
  int h;

  Lines(int startingX) {
    y=height/2;
    w=100;
    h=10;
    xSpeed=0;
    x=startingX;
  }

  void render() {

    fill(255);
    rect(x, y, w, h);
  }

  void move() {
    if (isDriving == true && xSpeed<=maxSpeed) {
      xSpeed+=accel;
      carAnimation.isAnimating = true;
    } else {
      xSpeed *= 1;
      xSpeed = max(0, xSpeed);
    }
    x-=xSpeed;

    //println(xSpeed);
  }

  void wallDetect() {
    if (x <= -w-50) {
      x=width+50;
    }
  }
  //////////////////////////////////////////
}
