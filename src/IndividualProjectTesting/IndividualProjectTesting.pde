//Sarah Zhang | Monday, March 18th, 2024 | Individual Project
//https://studio.processingtogether.com/sp/pad/export/ro.9eDRvB4LRmLrr; GoToLoop

static final int MAX = 6, GAP = 50, DIM = 120, RAD = DIM >> 1;
int page, cx, cy;
PFont font1, font2;

Button back, next, app1, app2, app3, app4, app5, app6;

float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

float oldX;
float oldY;
color redC = color(240, 111, 128);
color greenC = color(0, 77, 12);
color blueC = color(2, 51, 155);
color yellow = color(240, 237, 143);
color orange = color(240, 210, 111);
color violet = color(199, 143, 240);
color blueGreen = color(187, 234, 209);
color yellowGreen = color(201, 234, 187);
color pink = color(240, 143, 185);
color lightBlue = color(166, 229, 252);
color white = color(255);
color black = color(0);
float masterStroke = 1;

int numBalls = 15;
float spring = 0.08;
float gravity = 0.05;
float friction = -1;
Ball[] balls = new Ball[numBalls];

int secret_num;
String Number = "";
String feedback = "";

void setup() {
  size(600, 400);
  font1 = loadFont("CourierNewPS-BoldMT-48.vlw");
  font2 = loadFont("ComicSansMS-48.vlw");

  //Page Setup
  noLoop();
  smooth();

  //rectMode(CORNER);
  //ellipseMode(CENTER);
  //textAlign(CENTER, CENTER);

  stroke(255);
  strokeWeight(1.5);

  cx = width  >> 1;
  cy = height >> 1;

  back = new Button("BACK", GAP, height - Button.H - GAP + 20, 0, 255);
  next = new Button("NEXT", width - Button.W - GAP, height - Button.H - GAP + 20, 0, 255);

  app1 = new Button("Clock", 68, 190, #F29292, 0);
  app2 = new Button("Draw", width/2 - 75, 190, #FFD2A8, 0);
  app3 = new Button("Random Bubbles", 382, 190, #FFF4BD, 0);
  app4 = new Button("App 4", 68, 250, #BEE9CB, 0);
  app5 = new Button("App 5", width/2 - 75, 250, #AAD4EE, 0);
  app6 = new Button("App 6", 382, 250, #D8C7FF, 0);

  //Clock:
  float radius = min(width, height) / 2.75;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;

  cx = width / 2;
  cy = height / 2;

  //Ball
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(30, 70), i, balls);
  }
  noStroke();
  fill(255, 204);
  
  //GuessNum
  if (page == 4)
  textAlign(CENTER);
  textFont(createFont("Georgia", 17));
  background(255);
}

void draw() {
  background(0);

  textAlign(CENTER);
  textFont(font2);
  textSize(16);
  fill(250);
  text("Page #" + page, width/2, 380);

  textSize(Button.TXTSZ);
  if (page > 0)    back.display();
  if (page < MAX)  next.display();
  if (page < 1)    app1.display();
  if (page < 1)    app2.display();
  if (page < 1)    app3.display();
  if (page < 1)    app4.display();
  if (page < 1)    app5.display();
  if (page < 1)    app6.display();

  //method("page" + page); // Works on Java Mode only!
  pageSelector();        // Workaround for PJS. But works on Java Mode as well!
}

void mousePressed() {
  if (page > 0   && back.isHovering)  --page;
  else if (page < MAX && next.isHovering)  ++page;
  else if (page < 1 && app1.isHovering)  ++page;
  else if (page < 1 && app2.isHovering)  ++page;
  else if (page < 1 && app3.isHovering)  ++page;
  else if (page < 1 && app4.isHovering)  ++page;
  else if (page < 1 && app5.isHovering)  ++page;
  else if (page < 1 && app6.isHovering)  ++page;

  redraw();
}

void mouseMoved() {
  back.isInside();
  next.isInside();
  app1.isInside();
  app2.isInside();
  app3.isInside();
  app4.isInside();
  app5.isInside();
  app6.isInside();

  redraw();
}

void keyPressed() {
  if (keyCode == ENTER || keyCode == RETURN || key == '\n') {
    int guess = parseInt(Number); // Convert the user's input to an integer

    if (guess == secret_num) {
      feedback = "Correct!! You got me this time! Well done!!";
    } else if (guess > secret_num) {
      feedback = "Wrong!! HAHA! Your going to have to try a smaller number!!";
    } else {
      feedback = "Wrong!! HAHA! Your going to have to try a bigger number!!";
    }

    Number = ""; // Clear the input box after each guess
  } else if (keyCode >= '0' && keyCode <= '9') {
    Number += key; // Append the digit to the input
  }
}

void page0() {
  textAlign(CENTER);

  fill(250);
  textFont(font1);
  textSize(42);
  text("MindScape Hub", width/2, 120);
  textFont(font2);
  textSize(20);
  text("by Sarah Zhang", width/2, 150);
  text("(Period 2A)", width/2, 170);
  textAlign(CENTER);
}

void page1() {
  fill(80);
  noStroke();
  ellipse(cx, cy - 20, clockDiameter, clockDiameter);

  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

  // Draw the hands of the clock
  stroke(255);
  strokeWeight(1);
  line(cx, cy - 20, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius - 20);
  strokeWeight(2);
  line(cx, cy - 20, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(4);
  line(cx, cy - 20, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);

  // Draw the minute ticks
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy - 20 + sin(angle) * secondsRadius;
    vertex(x, y);
  }
  endShape();
}

void page2() {
  strokeWeight(1);
  fill(redC);
  rect(10, 10, 25, 25);
  fill(blueC);
  rect(35, 10, 25, 25);
  fill(greenC);
  rect(10, 35, 25, 25);
  fill(yellow);
  rect(35, 35, 25, 25);
  fill(orange);
  rect(10, 60, 25, 25);
  fill(violet);
  rect(35, 60, 25, 25);
  fill(blueGreen);
  rect(10, 85, 25, 25);
  fill(yellowGreen);
  rect(35, 85, 25, 25);
  fill(pink);
  rect(10, 110, 25, 25);
  fill(lightBlue);
  rect(35, 110, 25, 25);
  fill(white);
  rect(10, 135, 25, 25);
  fill(black);
  rect(35, 135, 25, 25);
  line(450, 30, 500, 30);
  strokeWeight(4);
  line(450, 50, 500, 50);
  strokeWeight(8);
  line(450, 80, 500, 80);
  strokeWeight(1);
  fill(255);
  rect(250, 10, 50, 50);

  if (mousePressed) {
    if (mouseX > 10 && mouseX < 35) {
      if (mouseY >10 && mouseY < 35) {
        stroke(redC);
      }
      if (mouseY>35 && mouseY < 60) {
        stroke(greenC);
      }
      if (mouseY>60 && mouseY<85) {
        stroke(orange);
      }
      if (mouseY>85 && mouseY<110) {
        stroke(blueGreen);
      }
      if (mouseY>110 && mouseY<135) {
        stroke(pink);
      }
      if (mouseY>135 && mouseY<160) {
        stroke(white);
      }
    }
    if (mouseX > 35 && mouseX < 60) {
      if ( mouseY > 10 && mouseY <35) {
        stroke(blueC);
      }
      if (mouseY > 35 && mouseY < 50) {
        stroke(yellow);
      }
      if (mouseY > 60 && mouseY < 85) {
        stroke(violet);
      }
      if (mouseY >85 && mouseY < 110) {
        stroke(yellowGreen);
      }
      if (mouseY > 110 && mouseY <135) {
        stroke(lightBlue);
      }
      if (mouseY >135 && mouseY <160) {
        stroke(black);
      }
    }
    if (mousePressed) {
      if (mouseX > 450 && mouseX <500) {
        if (mouseY >10 && mouseY <40) {
          masterStroke= 1;
        }
      }
      if (mouseX > 450 && mouseX <500) {
        if (mouseY >40 && mouseY <70) {
          masterStroke= 4;
        }
      }
      if (mouseX > 450 && mouseX <500) {
        if (mouseY > 70 && mouseY <100) {
          masterStroke= 7;
        }
      }
      strokeWeight(masterStroke);
    }
    if (mousePressed) {
      if (mouseX > 250 && mouseX <300) {
        if (mouseY > 10 && mouseY <60) {
          background(255);
        }
      }
    }
    if (mousePressed) {
      line(mouseX, mouseY, oldX, oldY);
    }
  }
  oldX = mouseX;
  oldY = mouseY;
}

void page3() {
  //background(0);
  for (Ball ball : balls) {
    ball.collide();
    ball.move();
    ball.display();
  }
}

void page4() {
  // Random number generation
  secret_num = int(random(1, 101)); // Generate a random number between 1 and 100
  println("Secret Number is  " + secret_num);
  
  textAlign(CENTER);
  fill(255);
  text("I'm Thinking of a number between 1-100 can you guess what it is? \nYou have 20 guesses,", width/2, 50);
  text("Better start thinking ;D", width/2, 90);
  text("Enter what you think it is into this box -->", 250, 250);
  rect(400, 220, 100, 50);
  text(feedback, 350, 200);
  fill(255);
  text(Number, 600, 350);
}

void page5() {
}

void page6() {
}

void pageSelector() { // Replaces method("") for PJS
  switch(page) {
  case 0:
    page0();
    break;

  case 1:
    page1();
    break;

  case 2:
    page2();
    break;

  case 3:
    page3();
    break;

  case 4:
    page4();
    break;

  case 5:
    page5();
    break;

  case 6:
    page6();
    break;
  }
}

//https://processing.org/examples/continuouslines.html
//https://processing.org/examples/scrollbar.html
//https://processing.org/examples/

//https://www.veritasai.com/veritasaiblog/https/8-coding-project-ideas-for-high-school-students
//https://dev.to/codeguppy/10-coding-projects-for-middle-and-high-school-students-2la1
