//Sarah Zhang | Wednesday, September 20th, 2023 | Etch-A-Sketch

int x, y; //Global Variable

void setup() {
  size(400, 400);
  frameRate(10);
  //Set start coords
  x = 60;
  y = 10;
}

void draw() {
  //background(127);
  stroke(0);
  strokeWeight(2);
  //drawName(); //Algorithm for printing initial variable
  //noLoop();
}

//Algorithm for your first name
void drawName() {
  moveLeft(50);
  moveDown(50);
  moveRight(50);
  moveDown(50);
  moveLeft(50);

  x = 80;
  y = 10;
  moveDown(100);
  moveRight(50);
  moveUp(100);
  moveLeft(50);

  x = 150;
  y = 10;
  moveDown(100);
  x = 150;
  y = 10;
  moveRight(50);
  x = 150;
  y = 60;
  moveRight(50);

  x = 220;
  y = 10;
  moveRight(50);
  x = 245;
  y = 10;
  moveDown(100);
}

//Method to draw right line
void moveRight(int rep) {
  for (int i = 0; i < rep; i++) {
    point(x + i, y);
  }
  x = x + (rep);
}

void moveDown(int rep) {
  for (int i = 0; i < rep; i++) {
    point(x, y + i);
  }
  y = y + rep;
}

void moveUp(int rep) {
  for (int i = 0; i < rep; i++) {
    point(x, y - i);
  }
  y = y - rep;
}

void moveLeft(int rep) {
  for (int i = 0; i < rep; i++) {
    point(x - i, y);
  }
  x = x - (rep);
}

void moveLeftUp(int rep) {
  for (int i = 0; i < rep; i++) {
    point(x - i, y - i);
  }
  x = x - (rep);
  y = y - (rep);
}

void moveLeftDown(int rep) {
  for (int i = 0; i < rep; i++) {
    point(x - i, y + i);
  }
  x = x - (rep);
  y = y + (rep);
}

void moveRightDown(int rep) {
  for (int i = 0; i < rep; i++) {
    point(x + i, y + i);
  }
  x = x + (rep);
  y = y + (rep);
}


//void keyPressed() {
//  if (key == CODED) {
//    if (keyCode == RIGHT) {
//      moveRight(5);
//    } else if (keyCode == DOWN) {
//      moveDown(5);
//    } else if (keyCode == LEFT) {
//      moveLeft(5);
//    } else if (keyCode == UP) {
//      moveUp(5);
//    }
//  }
//}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    moveUp(5);
  } else if (key == 'a' || key == 'A') {
    moveLeft(5);
  } else if (key == 's' || key == 'S') {
    moveDown(5);
  } else if (key == 'd' || key == 'D') {
    moveRight(5);
  }
}

void mousePressed() {
  saveFrame("line-######.png");
}
