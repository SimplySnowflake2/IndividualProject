//Sarah Zhang | Friday, September 29th, 2023 | Screen Saver App

float xpos;
float ypos;
float strokeW;
float pointCount;
int dir;

void setup() {
  //size(displayWidth, displayHeight);
  size(1000, 1000);
  background(random(100, 255));
  xpos = random(width);
  ypos = random(height);
  dir = 0;
  frameRate(15);
}

void draw() {
  strokeW = random(1, 3);
  strokeWeight(strokeW);
  pointCount = random(5, 50);
  stroke(random(50, 200));

  //Edge Detection
  if (xpos > width || xpos < 0 || ypos > height || ypos < 0) {
    xpos = random(width);
    ypos = random(height);
    background(random(100));
  }

  //Randomize directional line segments
  dir = int(random(4));
  if (dir == 0) {
    moveRight(xpos, ypos, pointCount);
  } else if (dir == 1) {
    moveLeft(xpos, ypos, pointCount);
  } else if (dir == 2) {
    moveUp(xpos, ypos, pointCount);
  } else {
    moveDown(xpos, ypos, pointCount);
  }
}

void moveRight(float startX, float startY, float moveCount) {
  for (float i = 0; i < moveCount; i++) {
    point(startX + i, startY);
    xpos = startX + i;
    ypos = startY;
  }
}

void moveLeft(float startX, float startY, float moveCount) {
  for (float i = 0; i < moveCount; i++) {
    point(startX - i, startY);
    xpos = startX - i;
    ypos = startY;
  }
}

void moveUp(float startX, float startY, float moveCount) {
  for (float i = 0; i < moveCount; i++) {
    point(startX, startY - i);
    xpos = startX;
    ypos = startY - i;
  }
}

void moveDown(float startX, float startY, float moveCount) {
  for (float i = 0; i < moveCount; i++) {
    point(startX, startY + 1);
    xpos = startX;
    ypos = startY + i;
  }
}

void mousePressed() {
  saveFrame("line-######.png");
}
