class Button {
  // Button location and size
  float x;
  float y;
  float w;
  float h;
  // Is the button on or off?
  boolean on, isNum;
  String val;
  //char val; (if you have exactly one character)
  color c1;
  int txt;

  // Constructor initializes all variables
  Button(float tempX, float tempY, float tempW, float tempH, String val, color c1, int txt, boolean isNum) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    on = false; // Button always starts as off
    this.val = val;
    this.c1 = c1;
    this.txt = txt;
    this.isNum = isNum;
  }

  void display () {
    rectMode(CENTER);
    if (on) {
      fill(#CBCBCB);
    } else {
      fill(c1);
    }
    rect(x, y, w, h, 10);
    fill(txt);
    textAlign(CENTER);
    text(val, x + 0.5, y + 6);
    textSize(16);
  }

  void hover () {
    if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2) {
      on = true;
    } else {
      on = false;
    }
  }
}
