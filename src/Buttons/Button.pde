class Button {
  // Button location and size
  float x;
  float y;
  float w;
  float h;
  // Is the button on or off?
  boolean on;

  // Constructor initializes all variables
  Button(float tempX, float tempY, float tempW, float tempH) {
    x  = tempX;
    y  = tempY;
    w  = tempW;
    h  = tempH;
    on = false;  // Button always starts as off
  }

  void display () {
    rectMode(CENTER);
    if (on) {
      fill(random(255), random(255), random(255));
    } else {
      fill(0);
    }
    rect(x, y, w, h);
    text("TEXT", x, y);
  }

  void hover () {
    if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2) {
      on = true;
    } else {
      on = false;
    }
  }
}
