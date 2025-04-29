
class Upgrades {
  int x;
  int w;
  int h;
  int y;
  int top = y-h/2;
  int bottom = y+h/2;
  int left = x-w/2;
  int right = x+w/2;

  Upgrades(int startingY, int startingX) {
    x = startingX;
    y = startingY;
    w = 200;
    h = 50;
  }

  void render(String words, String coin) {
    rectMode(CENTER);
    textAlign(CENTER);
    fill(color(0));
    rect(x, y, w, h, 10);
    fill(255);
    textSize(h/2);
    text(words, x, y+5);
    top = y-h/2;
    bottom = y+h/2;
    left = x-w/2;
    right = x+w/2;
    println(maxSpeed);
    println(accel);
    fill(#B29D00);
    text(coin, x, y+h);
    fill(0);
  }

  boolean hitbox() {

    if (mouseX>=left && mouseX<=right && mouseY>=top && mouseY<=bottom && state==3) {
      return true;
    } else {
      return false;
    }
  }


  ///////////////////////////////////
}
