//Sarah Zhang | Monday, March 18th, 2024 | Individual Project

static final int MAX = 6, GAP = 50, DIM = 120, RAD = DIM >> 1;
int page, cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
PFont font1, font2;

Button back, next;

void setup() {
  size(600, 400);
  font1 = loadFont("CourierNewPS-BoldMT-48.vlw");
  font2 = loadFont("ComicSansMS-48.vlw");

  //Page Setup
  noLoop();
  smooth();

  rectMode(CORNER);
  ellipseMode(CENTER);
  textAlign(CENTER, CENTER);

  stroke(0);
  strokeWeight(1.5);

  cx = width  >> 1;
  cy = height >> 1;

  back = new Button("BACK", GAP, height - Button.H - GAP);
  next = new Button("NEXT", width - Button.W - GAP, height - Button.H - GAP);

  //Clock SetUp
  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;

  cx = width/2;
  cy = height/2;
}

void draw() {
  background(0);

  //textSize(100);
  fill(Button.TXTC);
  //text("Page #" + page, cx, cy);

  textSize(Button.TXTSZ);
  if (page > 0)    back.display();
  if (page < MAX)  next.display();

  //method("page" + page); // Works on Java Mode only!
  pageSelector();        // Workaround for PJS. But works on Java Mode as well!
}

void mousePressed() {
  if      (page > 0   && back.isHovering)  --page;
  else if (page < MAX && next.isHovering)  ++page;

  redraw();
}

void mouseMoved() {
  back.isInside();
  next.isInside();

  redraw();
}

void page0() {
  textAlign(CENTER);

  textFont(font1);
  textSize(56);
  text("MindScape Hub", width/2, 120);
  textFont(font2);
  textSize(28);
  text("by Sarah Zhang", width/2, 160);
  text("(Period 2A)", width/2, 200);
}

void page1() {
  fill(#FFFF00);
  //rect(cx - RAD, GAP*2 - RAD, DIM, DIM);
  // Draw the clock background
  fill(80);
  noStroke();
  ellipse(cx, cy, clockDiameter, clockDiameter);

  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

  // Draw the hands of the clock
  stroke(255);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  strokeWeight(2);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);

  // Draw the minute ticks
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x, y);
  }
  endShape();
}

void page2() {
  fill(#008000);
  //triangle(cx, GAP*2 - RAD, cx - RAD, GAP*2 + RAD, cx + RAD, GAP*2 + RAD);
}

void page3() {
}

void page4() {
}

void page5() {
}

void page6() {
}

void page7() {
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
  }
}

//https://processing.org/examples/continuouslines.html
//https://processing.org/examples/scrollbar.html
//https://processing.org/examples/clock.html
//https://processing.org/examples/

//https://studio.processingtogether.com/sp/pad/export/ro.9eDRvB4LRmLrr

//https://codeguppy.com/code.html?t=blocky
//https://codeguppy.com/code.html?t=artist
//https://codeguppy.com/code.html?t=clock

//https://www.veritasai.com/veritasaiblog/https/8-coding-project-ideas-for-high-school-students
//https://dev.to/codeguppy/10-coding-projects-for-middle-and-high-school-students-2la1
