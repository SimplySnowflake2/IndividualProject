//Sarah Zhang | Monday, March 18th, 2024 | Individual Project
//https://studio.processingtogether.com/sp/pad/export/ro.9eDRvB4LRmLrr; GoToLoop

static final int MAX = 6, GAP = 50, DIM = 120, RAD = DIM >> 1;
int page, cx, cy;
PFont font1, font2;

Button back, next, app1, app2, app3, app4, app5, app6;

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

  stroke(255);
  strokeWeight(1.5);

  cx = width  >> 1;
  cy = height >> 1;

  back = new Button("BACK", GAP, height - Button.H - GAP + 20, 0, 255);
  next = new Button("NEXT", width - Button.W - GAP, height - Button.H - GAP + 20, 0, 255);

  app1 = new Button("App 1", 68, 190, #F29292, 0);
  app2 = new Button("App 2", width/2 - 75, 190, #FFD2A8, 0);
  app3 = new Button("App 3", 382, 190, #FFF4BD, 0);
  app4 = new Button("App 4", 68, 250, #BEE9CB, 0);
  app5 = new Button("App 5", width/2 - 75, 250, #AAD4EE, 0);
  app6 = new Button("App 6", 382, 250, #D8C7FF, 0);
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
  //fill(#FFFF00);
}

void page2() {
  //fill(#008000);
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
//https://processing.org/examples/clock.html
//https://processing.org/examples/

//https://codeguppy.com/code.html?t=blocky
//https://codeguppy.com/code.html?t=artist
//https://codeguppy.com/code.html?t=clock

//https://www.veritasai.com/veritasaiblog/https/8-coding-project-ideas-for-high-school-students
//https://dev.to/codeguppy/10-coding-projects-for-middle-and-high-school-students-2la1
