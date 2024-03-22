static final int MAX = 2, GAP = 50, DIM = 120, RAD = DIM >> 1;
int page, cx, cy;

Button back, next;

void setup() {
  size(600, 400);

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
}

void draw() {
  background(0300);

  textSize(100);
  fill(Button.TXTC);
  text("Page #" + page, cx, cy);

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
  fill(#FF00FF);
  ellipse(cx, GAP*2, DIM, DIM);
}

void page1() {
  fill(#FFFF00);
  rect(cx - RAD, GAP*2 - RAD, DIM, DIM);
}

void page2() {
  fill(#008000);
  triangle(cx, GAP*2 - RAD, cx - RAD, GAP*2 + RAD, cx + RAD, GAP*2 + RAD);
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
