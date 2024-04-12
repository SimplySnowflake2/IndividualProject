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

int squareSize = 16;
int noRows = 30;
int noCols = 50;

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
  app2 = new Button("App 2", width/2 - 75, 190, #FFD2A8, 0);
  app3 = new Button("App 3", 382, 190, #FFF4BD, 0);
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

  if (page == 2) {
    stroke(255);
    if (mousePressed == true) {
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
  }
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
}

void page3() {
}

void page4() {
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
