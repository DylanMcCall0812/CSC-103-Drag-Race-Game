
class Menu {
  int x;
  int w;
  int h;
  int y;
  int top = y-h/2;
  int bottom = y+h/2;
  int left = x-w/2;
  int right = x+w/2;

  Menu(int startingY) {
    x = 50;
    y = startingY;
    w = 50;
    h = 10;
  }

  void render() {
    rectMode(CENTER);
    textAlign(CENTER);
    fill(255);
    rect(x, y-20, w, h);
    rect(x, y, w, h);
    rect(x, y+20, w, h);
    fill(255);
    top = y-20;
    bottom = y+20;
    left = x-w/2;
    right = x+w/2;
  }

  boolean hitbox() {

    if (mouseX>=left && mouseX<=right && mouseY>=top && mouseY<=bottom && (state==1 || state==2 || state==3)) {
      return true;
    } else {
      return false;
    }
  }


  ///////////////////////////////////
}
