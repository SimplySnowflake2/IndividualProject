//Sarah Zhang | Wednesday, October 25th, 2023 | Calculator

String dVal, op;
//String op;
boolean left;
float l, r, result;

Button[] buttons = new Button [24];

void setup() {
  size(230, 390);

  dVal = "0";
  op = "";
  left = true;
  l = 0.0;
  r = 0.0;
  result = 0.0;

  buttons[0] = new Button(40, 355, 40, 30, "0", 255, 0, true);
  buttons[1] = new Button(40, 315, 40, 30, "1", 255, 0, true);
  buttons[2] = new Button(90, 315, 40, 30, "2", 255, 0, true);
  buttons[3] = new Button(140, 315, 40, 30, "3", 255, 0, true);
  buttons[4] = new Button(40, 275, 40, 30, "4", 255, 0, true);
  buttons[5] = new Button(90, 275, 40, 30, "5", 255, 0, true);
  buttons[6] = new Button(140, 275, 40, 30, "6", 255, 0, true);
  buttons[7] = new Button(40, 235, 40, 30, "7", 255, 0, true);
  buttons[8] = new Button(90, 235, 40, 30, "8", 255, 0, true);
  buttons[9] = new Button(140, 235, 40, 30, "9", 255, 0, true);
  buttons[10] = new Button(90, 355, 40, 30, ".", 255, 0, true);
  buttons[11] = new Button(140, 355, 40, 30, "+/-", 255, 0, false);

  buttons[12] = new Button(190, 195, 40, 30, "/", #C7ECFF, 0, false);
  buttons[13] = new Button(190, 235, 40, 30, "x", #C7ECFF, 0, false);
  buttons[14] = new Button(190, 275, 40, 30, "-", #C7ECFF, 0, false);
  buttons[15] = new Button(190, 315, 40, 30, "+", #C7ECFF, 0, false);
  buttons[16] = new Button(190, 355, 40, 30, "=", #C7ECFF, 0, false);

  buttons[17] = new Button(40, 155, 40, 30, "x²", 0, 255, false);
  buttons[18] = new Button(90, 155, 40, 30, "√", 0, 255, false);
  buttons[19] = new Button(140, 155, 40, 30, "%", 0, 255, false);
  buttons[20] = new Button(190, 155, 40, 30, "clear", 0, 255, false);
  buttons[21] = new Button(40, 195, 40, 30, "π", 0, 255, false);
  buttons[22] = new Button(90, 195, 40, 30, "ln", 0, 255, false);
  buttons[23] = new Button(140, 195, 40, 30, "eˣ", 0, 255, false);
}

void draw() {
  background(#013C22);
  updateDisplay();
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover();
  }
}

void keyPressed() {
  println("key:" + key);
  println("keyCode" + keyCode);
  if (key == 0 || keyCode == 96 || keyCode == 48) { //"||" means or
    handleEvent("0", true);
  } else if (key == 1 || keyCode == 97 || keyCode == 49) {
    handleEvent("1", true);
  } else if (key == 2 || keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (key == 3 || keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (key == 4 || keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (key == 5 || keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (key == 6 || keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (key == 7 || keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (key == 8 || keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (key == 9 || keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (key == '+' || keyCode == 17) {
    handleEvent("+", false);
  } else if (key == '-' || keyCode == 45) {
    handleEvent("-", false);
  } else if (key == 'x' || keyCode == 88) {
    handleEvent("x", false);
  } else if (key == '/' || keyCode == 47) {
    handleEvent("/", false);
  } else if (key == '=' || keyCode == 10) {
    handleEvent("=", false);
  } else if (key == '.' || keyCode == 46) {
    handleEvent(".", true);
  } else if (keyCode == 12 || keyCode == 67) {
    handleEvent("clear", false);
  }
}

void handleEvent(String keyVal, boolean isNum) {
  if (left && dVal.length() < 21 && isNum) { //left == true (left)
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      if (!dVal.contains(".")) {
        dVal += keyVal;
      }
    }
    l = float(dVal);
  } else if (!left && dVal.length() < 21 && isNum) { //left == false (!left)
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      if (!dVal.contains(".")) {
        dVal += keyVal;
      }
    }
    r = float(dVal);
  } else if (keyVal.equals("+") && !isNum) {
    op = "+";
    left = false;
    dVal = "0";
  } else if (keyVal.equals("-") && !isNum) {
    op = "-";
    left = false;
    dVal = "0";
  } else if (keyVal.equals("x") && !isNum) {
    op = "x";
    left = false;
    dVal = "0";
  } else if (keyVal.equals("/") && !isNum) {
    op = "/";
    left = false;
    dVal = "0";
  } else if (keyVal.equals("=") && !isNum) {
    performCalculation();
  } else if (keyVal.equals("clear") && !isNum) {
    dVal = "0";
    op = "";
    left = true;
    l = 0.0;
    r = 0.0;
    //result = 0.0;
  }
}

void mousePressed() {
  for (int i = 0; i < buttons.length; i++) {
    // In order to tap into a button:
    // Check if: 1. over a button, 2. is it a number and 3. is it left or right of op?
    if (buttons[i].on && buttons[i].isNum) { //left == true (left)
      handleEvent(buttons[i].val, true);
    } else if (buttons[i].on && buttons[i].isNum) { //left == false (!left)
      handleEvent(buttons[i].val, true);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("clear")) {
      handleEvent("clear", false);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("+")) {
      handleEvent("+", false);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("-")) {
      handleEvent("-", false);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("/")) {
      handleEvent("/", false);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("x")) {
      handleEvent("x", false);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("=")) {
      handleEvent("=", false);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("+/-")) {
      if (left) {
        l = -l;
        dVal = str(l);
      } else {
        r = -r;
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("x²")) {
      if (left) {
        l = sq(l);
        dVal = str(l);
      } else {
        r = sq(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("√")) {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("π")) {
      if (left) {
        l = l * PI;
        dVal = str(l);
      } else {
        r = r * PI;
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("ln")) {
      if (left) {
        l = log(l);
        dVal = str(l);
      } else {
        r = log(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("%")) {
      if (left) {
        l = l / 100;
        dVal = str(l);
      } else {
        r = r / 100;
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("eˣ")) {
      if (left) {
        l = exp(l);
        dVal = str(l);
      } else {
        r = exp(r);
        dVal = str(r);
      }
    }
  }
  println("l:" + l);
  println("r:" + r);
  println("op:" + op);
  println("result:" + result);
  println("left:" + left);
}


void updateDisplay() {
  fill(255);
  rectMode(CENTER);
  rect(width/2, 70, 190, 100, 10);
  fill(0);
  textSize(16);
  textAlign(LEFT);
  text(dVal, 33, 40);
}

void performCalculation() {
  if (op.equals("+")) {
    result = l + r;
  } else if (op.equals("-")) {
    result = l - r;
  } else if (op.equals("/")) {
    result = l/r;
  } else if (op.equals("x")) {
    result = l * r;
  }
  dVal = str(result);
  l = result;
}
