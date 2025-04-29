

class Stats {

  Stats() {
  }

  void render(int x, int y, int w, int h) {
    //int rate = (int)round(accel);
    //noFill();
    stroke(#7E9BFF);
    strokeWeight(5);
    rect(x, y, w, h+50);
    fill(255);
    stroke(0);
    strokeWeight(1);
    text("Top Speed", x, y-h/2 + 50);
    text(nf(maxSpeed) + " " + "MPH", x, y-h/2+100);
    text("stats", x, y-h/2 - 5);
    text("Acceleration rate", x, y-h/2+150);
    text(nf(accel*2400), x, y-h/2+200);
    text("pixels/sec", x, y-h/2+250);
    //println(rate);
    fill(#B29D00);
    text("coins" + " " + coinValue, x, y-h/2+300);
    fill(255);
  }


  /////////////////////////////
}
