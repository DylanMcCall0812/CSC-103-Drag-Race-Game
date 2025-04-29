long startTime;
long seconds;
long milliSec;


class Timer {
  int x;
  int y;
  long elapsedTime;
  boolean isTimerRunning;

  Timer() {
  }


  void timerAction() {
    

    if (xP<=xS) {
      startTime = millis();
      isTimerRunning = true;
    }

    if (xP>=xF) {
      isTimerRunning  = false;
    }

    if (isTimerRunning == true) {
      elapsedTime = millis() - startTime;
    }

    long seconds1 = (elapsedTime);
    long milliSec1 = (elapsedTime % 1000);
    fill(255);
    
    seconds = seconds1;
    milliSec = milliSec1;

    text(nf(seconds/1000) + "." + nf(milliSec), width-100, 50);
  }

  //used Gemini AI to get the basic idea of what to do for the timer





  /////////////////////////////////////
}
